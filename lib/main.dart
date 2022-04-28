import 'package:flutter/material.dart';

void main() => runApp(const TodoListApp());

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        // Application name
        home: Scaffold(
      body: FormAddTask(),
    ));
  }
}

class FormAddTask extends StatelessWidget {
  const FormAddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Task'),
      ),
      body: Column(children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(fontSize: 16.0),
            decoration: InputDecoration(
              icon: Icon(Icons.task),
              labelText: "Titulo Task",
              hintText: "Fazer compras",
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(
              fontSize: 16.0,
            ),
            decoration: InputDecoration(
              icon: Icon(Icons.telegram),
              labelText: "Descrição Task",
              hintText: "1KG Batata, 1Kg Cenoura",
            ),
          ),
        ),
        SizedBox(height: 30),
        ElevatedButton(
          child: Text("Add Task"),
          onPressed: () {
            print('click button');
          },
        ),
      ]),
    );
  }
}

class listTasks extends StatelessWidget {
  const listTasks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tasks'),
      ),
      body: Column(children: <Widget>[
        TaskTransferencia(Task("100.0", "1000")),
        TaskTransferencia(Task("200.0", "2000")),
        TaskTransferencia(Task("300.0", "3000")),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TaskTransferencia extends StatelessWidget {
  final Task _task;

  TaskTransferencia(this._task);

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

class Task {
  final String taskTitle;
  final String taskSubTitle;

  Task(this.taskTitle, this.taskSubTitle);
}
