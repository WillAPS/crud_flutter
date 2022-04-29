import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(const TodoListApp());

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // Application name
        home: Scaffold(
      body: TasksList(),
    ));
  }
}

class AddTask extends StatelessWidget {
  final TextEditingController _controllerTitleTask = TextEditingController();
  final TextEditingController _controllerSubTitleTask = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Criando Task'),
      ),
      body: Column(children: <Widget>[
        Editor(
          controller: _controllerTitleTask,
          placeholder: 'Titulo Task',
          dica: 'Fazer compra',
          iconTask: Icons.task,
        ),
        Editor(
          controller: _controllerSubTitleTask,
          placeholder: 'Descrição Task',
          dica: '1Kg Cenoura',
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          child: const Text("Add Task"),
          onPressed: () => _createdTask(context),
          style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(const Size(120, 60))),
        ),
      ]),
    );
  }

  void _createdTask(BuildContext context) {
    final String titleTask = _controllerTitleTask.text;
    final String subTitleTask = _controllerSubTitleTask.text;
    Task(titleTask, subTitleTask);
    if (titleTask != null && subTitleTask != null) {
      final createdTask = Task(titleTask, subTitleTask);
      Navigator.pop(context, createdTask);
    }
  }
}

class Editor extends StatelessWidget {
  Editor(
      {required this.controller,
      required this.placeholder,
      required this.dica,
      this.iconTask});

  final TextEditingController controller;
  final String placeholder;
  final String dica;
  final IconData? iconTask;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          fontSize: 16.0,
        ),
        decoration: InputDecoration(
          icon: Icon(iconTask),
          labelText: placeholder,
          hintText: dica,
        ),
      ),
    );
  }
}

class TasksList extends StatefulWidget {
  TasksList({Key? key}) : super(key: key);

  final List<Task> _tasks = [];
  @override
  State<StatefulWidget> createState() {
    return TasksListState();
  }
}

class TasksListState extends State<TasksList>{

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Tasks'),
        ),
        body: ListView.builder(
          itemCount:widget._tasks.length ,
          itemBuilder: (context, index) {
            final task = widget._tasks[index];
            return TaskTransferencia(task);
          } ,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            final Future<Task?> future =
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return AddTask();
            }));
            future.then((receiveTask) {
              Future.delayed(const Duration(milliseconds: 500), () {
                debugPrint(receiveTask?.taskTitle);
                setState(() {
                  widget._tasks.add(receiveTask!);
                });
              });
            });
          },
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
