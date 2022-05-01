import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  Editor({
    required this.controller,
    required this.placeholder,
    required this.dica,
    this.iconTask,
  });

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
