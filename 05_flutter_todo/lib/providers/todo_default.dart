import 'package:flutter_data_practice/models/todo.dart';

class TodoDefault {
  List<Todo> dummyTodos = [
    Todo(id: 1, title: '플러터 공부 시작하기', description: '뽕뽑는 플러터를 읽어봅시다.'),
    Todo(id: 2, title: '서점가기', description: '뽕뽑는 플러터를 사러 갈거에요.'),
    Todo(id: 3, title: '공원에서 운동하기', description: '집 근처 공원에 가서 안전하게 운동합니다.'),
    Todo(id: 4, title: '출근 준비하기', description: '내일이 월요일이라니..'),
  ];

  List<Todo> getTodos() {
    return dummyTodos;
  }

  Todo getTodo(int id) {
    return dummyTodos[id];
  }

  Todo addTodo(Todo todo) {
    Todo newTodo = Todo(
        id: dummyTodos.length + 1,
        title: todo.title,
        description: todo.description);
    dummyTodos.add(newTodo);
    return newTodo;
  }

  void deleteTodo(int id) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == id) {
        dummyTodos.removeAt(i);
      }
    }
  }

  void updateTodo(Todo todo) {
    for (int i = 0; i < dummyTodos.length; i++) {
      if (dummyTodos[i].id == todo.id) {
        dummyTodos[i] = todo;
      }
    }
  }
}
