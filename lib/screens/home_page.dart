import 'package:flutter/material.dart';
import 'package:helloworld/screens/task/listar_tasks.dart';
import 'package:helloworld/screens/task/task_form.dart';

import '../theme_changer.dart';

const _titleAppBar = Text('Dashboard');

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool click = true;

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
                click = !click;
              });
            },
            icon: Icon((click == false) ? Icons.light_mode : Icons.dark_mode),
          ),
        ],
      ),
      body: GridView.count(
        padding: const EdgeInsets.fromLTRB(5, 100, 5, 80),
        crossAxisCount: 2,
        children: <Widget>[
          buildElevatedButtonTasks(),
          buildElevatedButtonNewTask(),
          buildElevatedButtonConfig(),
          buildElevatedButtonProfile(),
        ],
      ),
    );
  }

  ElevatedButton buildElevatedButtonTasks() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blue,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => TasksList()));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.task_alt,
              color: Colors.white,
              size: 60,
            ),
            Text(
              'Lisk Task',
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButtonConfig() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueAccent,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.person,
              color: Colors.white,
              size: 60,
            ),
            Text(
              'Profile',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButtonProfile() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlue,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      onPressed: () {},
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.settings,
              color: Colors.white,
              size: 60,
            ),
            Text(
              'Config',
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
          ],
        ),
      ),
    );
  }

  ElevatedButton buildElevatedButtonNewTask() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.lightBlueAccent,
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      ),
      onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => TaskForm()));
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
        height: 150,
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Icon(
              Icons.add_circle_outline,
              color: Colors.white,
              size: 60,
            ),
            Text(
              'New Task',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
