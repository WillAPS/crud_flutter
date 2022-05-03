import 'package:flutter/material.dart';
import 'package:helloworld/database/DAO/task_dao.dart';

import '../../models/task.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final TextEditingController _controllerTitleTask = TextEditingController();
  final TextEditingController _controllerSubTitleTask = TextEditingController();
  final TaskDAO _dao = TaskDAO();

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _controllerTitleTask,
              decoration: const InputDecoration(
                labelText: 'Title Task',
              ),
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: TextField(
                controller: _controllerSubTitleTask,
                decoration: const InputDecoration(
                  labelText: 'Describe Task',
                ),
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () {
                    final String titleTask = _controllerTitleTask.text;
                    final String subTitleTask = _controllerSubTitleTask.text;
                    final Task newTask = Task(0, titleTask, subTitleTask);
                    _dao.save(newTask).then((id) => Navigator.pop(context));
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
