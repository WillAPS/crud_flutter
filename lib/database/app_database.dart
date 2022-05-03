import 'package:helloworld/database/DAO/task_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'crud.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDAO.tableSql);
  }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
}
