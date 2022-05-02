import 'package:flutter/material.dart';

import '../../components/editor.dart';
import '../../models/task.dart';

class AddTask extends StatelessWidget {
  final TextEditingController _controllerTitleTask = TextEditingController();
  final TextEditingController _controllerSubTitleTask = TextEditingController();

  AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criando Task'),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
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
            child: const Text("Adicionar"),
            onPressed: () => _createdTask(context),
            style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(const Size(120, 60))),
          ),
        ]),
      ),
    );
  }
  void _createdTask(BuildContext context) {
    final String titleTask = _controllerTitleTask.text;
    final String subTitleTask = _controllerSubTitleTask.text;
    Task(titleTask, subTitleTask);
    final createdTask = Task(titleTask, subTitleTask);
    Navigator.pop(context, createdTask);
  }
}


