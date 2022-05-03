import 'package:flutter/material.dart';
import 'package:helloworld/database/DAO/task_dao.dart';

import '../../models/task.dart';

const _titleAppBar = Text('Tasks');

class TasksList extends StatelessWidget {
  TasksList({Key? key}) : super(key: key);

  final TaskDAO _dao = TaskDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titleAppBar,
      ),
      body: FutureBuilder<List<Task>>(
        initialData: [],
        future: Future.delayed(const Duration(milliseconds: 0))
            .then((value) => _dao.findAll()),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              break;
            case ConnectionState.waiting:
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const <Widget>[
                    CircularProgressIndicator(),
                    Text('Loading'),
                  ],
                ),
              );
            case ConnectionState.active:
              break;
            case ConnectionState.done:
              final List<Task> tasks = snapshot.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final Task task = tasks[index];
                  return _TaskItem(task);
                },
                itemCount: tasks.length,
              );
          }
          return const Text('Unknown error');
        },
      ),
    );
  }
}

class _TaskItem extends StatelessWidget {
  final Task task;

  _TaskItem(this.task);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.task_alt),
        title: Text(task.taskTitle),
        subtitle: Text(task.taskSubTitle),
      ),
    );
  }
}
