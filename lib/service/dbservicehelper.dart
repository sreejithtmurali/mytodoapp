import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/Todo.dart';

class DbServiceHelper{
  late Database _database;
  Future<void> initdb() async {
    _database=await openDatabase
      (
        join(await getDatabasesPath(),"mydatabase.db"),
        version: 1,
        onCreate: (Database db,int version)
        {
          db.execute("CREATE TABLE Todotable(id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,discription TEXT,date TEXT,time TEXT,priority TEXT,status TEXT)");
        }
    );
  }

  Future<int> insertTodo(Todo s) async {
    await initdb();
    return await _database.insert("Todotable", s.toMap());
  }
  Future<int> updateTodo(Todo s) async {
    await initdb();
    return await _database.update("Todotable", s.toMap(),where: "id=?",whereArgs: [s.id]);
  }
  Future<int> deleteTodo(Todo s) async {
    await initdb();
    return await _database.delete("Todotable", where: "id=?",whereArgs: [s.id]);
  }
  Future<List<Map<String,dynamic>>> getallTodos() async {
    await initdb();
    var list=await _database.query("Todotable");
    return list;
  }

}