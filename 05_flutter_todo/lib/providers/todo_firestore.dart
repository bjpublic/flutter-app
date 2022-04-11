import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_data_practice/models/todo.dart';

class TodoFirebase {
  late CollectionReference todosReference; // collection 'todos' reference
  late Stream<QuerySnapshot> todoStream; // stream of todos

  Future initDb() async {
    todosReference = FirebaseFirestore.instance.collection('todos');
    todoStream = todosReference.snapshots();
  }

  List<Todo> getTodos(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((DocumentSnapshot document) {
      return Todo.fromSnapshot(document);
    }).toList();
  }

  Future addTodo(Todo todo) async {
    todosReference.add(todo.toMap());
  }

  Future updateTodo(Todo todo) async {
    todo.reference?.update(todo.toMap());
  }

  Future deleteTodo(Todo todo) async {
    todo.reference?.delete();
  }
}
