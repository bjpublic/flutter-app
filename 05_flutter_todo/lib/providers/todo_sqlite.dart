import 'package:flutter_data_practice/models/todo.dart';
import 'package:sqflite/sqflite.dart';

class TodoSqlite {
  late Database db;

  Future initDb() async {
    // MissingPluginError 발생하면 앱 중지 / 앱 삭제 후 다시 빌드
    db = await openDatabase('my_db.db');
    await db.execute(
      'CREATE TABLE IF NOT EXISTS MyTodo (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, title TEXT, description TEXT)',
    );
  }

  Future<List<Todo>> getTodos() async {
    List<Todo> todos = [];
    List<Map> maps =
        await db.query('MyTodo', columns: ['id', 'title', 'description']);
    print(maps);
    maps.forEach((map) {
      todos.add(Todo.fromMap(map));
    });
    print("[sqlite] GET TODOS");
    print(todos);
    return todos;
  }

  Future<Todo?> getTodo(int id) async {
    List<Map> map = await db.query('MyTodo',
        columns: ['id', 'title', 'description'],
        where: 'id = ?',
        whereArgs: [id]);
    if (map.length > 0) {
      return Todo.fromMap(map[0]);
    }
  }

  Future addTodo(Todo todo) async {
    print("[sqlite] ADD");
    int id = await db.insert('MyTodo', todo.toMap());
    print("id : " + id.toString());
  }

  Future deleteTodo(int id) async {
    await db.delete('MyTodo', where: 'id = ?', whereArgs: [id]);
  }

  Future updateTodo(Todo todo) async {
    await db
        .update('MyTodo', todo.toMap(), where: 'id = ?', whereArgs: [todo.id]);
  }
}
