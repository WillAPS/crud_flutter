import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:helloworld/screens/task/list.dart';
import 'package:helloworld/theme_changer.dart';

void main() => runApp(const TodoListApp());

class TodoListApp extends StatelessWidget {
  const TodoListApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      defaultBrightness: Brightness.dark,
      defaultIcon: Icons.dark_mode,
      builder: (context, _brightness, _icon) {
        return MaterialApp(
          theme: ThemeData(primarySwatch: Colors.blue, brightness: _brightness),
          home: TasksList(),
        );
      },
    );
  }
}