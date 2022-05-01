import 'package:flutter/material.dart';

import '../../models/task.dart';
import '../../theme_changer.dart';
import 'add.dart';

const _titleAppBar = Text('Tasks');

class TasksList extends StatefulWidget {
  TasksList({Key? key}) : super(key: key);

  final List<Task> _tasks = [];

  @override
  State<StatefulWidget> createState() {
    return TasksListState();
  }
}

class TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titleAppBar,
        actions: <Widget>[
          IconButton(
              onPressed: () {
                ThemeBuilder.of(context)?.changeTheme();
                setState(() {
                  icon: Icon(Icons.dark_mode);
                });
              },
              icon: Icon(Icons.light_mode))
        ],
      ),
      body: ListView.builder(
        itemCount: widget._tasks.length,
        itemBuilder: (context, index) {
          final task = widget._tasks[index];
          return TaskTransferencia(task);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTask();
          })).then((receiveTask) => _att(receiveTask));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _att(Task? receiveTask) {
     if (receiveTask != null &&
        receiveTask.taskTitle != "" &&
        receiveTask.taskSubTitle != "") {
      setState(() {
        widget._tasks.add(receiveTask);
      });
    }
  }
}

class TaskTransferencia extends StatelessWidget {
  final Task _task;

  TaskTransferencia(this._task, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.task),
        title: Text(_task.taskTitle),
        subtitle: Text(_task.taskSubTitle),
      ),
    );
  }
}