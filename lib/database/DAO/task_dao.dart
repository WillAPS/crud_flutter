import 'package:sqflite/sqflite.dart';

import '../../models/task.dart';
import '../app_database.dart';

class TaskDAO {

  static String get tableSql => 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_titleTask TEXT, '
      '$_subTitleTask TEXT)';

  static const String _tableName = 'tasks';
  static const String _id = 'id';
  static const String _titleTask = 'titleTask';
  static const String _subTitleTask = 'subTitleTask';

  Future<int> save(Task task) async {
    final Database db = await getDatabase();
    Map<String, dynamic> taskMap = _toMap(task);
    return db.insert(_tableName, taskMap);
  }

  Map<String, dynamic> _toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_titleTask] = task.taskTitle;
    taskMap[_subTitleTask] = task.taskSubTitle;
    return taskMap;
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Task> tasks = _toList(result);
    return tasks;
  }

  List<Task> _toList(List<Map<String, dynamic>> result) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> row in result) {
      final Task task = Task(row[_id], row[_titleTask], row[_subTitleTask]);
      tasks.add(task);
    }
    return tasks;
  }
}