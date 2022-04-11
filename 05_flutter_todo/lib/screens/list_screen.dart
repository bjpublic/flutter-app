import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_data_practice/models/todo.dart';
import 'package:flutter_data_practice/providers/todo_default.dart';
import 'package:flutter_data_practice/screens/news_screen.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Todo> todos = [];
  TodoDefault todoDefault = TodoDefault();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      todos = todoDefault.getTodos();
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('할 일 목록 앱'),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NewsScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.book),
                  Text('뉴스'),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Text('+', style: TextStyle(fontSize: 25)),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                String title = '';
                String description = '';
                return AlertDialog(
                  title: Text('할 일 추가하기'),
                  content: Container(
                    height: 200,
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(labelText: '제목'),
                        ),
                        TextField(
                          onChanged: (value) {
                            description = value;
                          },
                          decoration: InputDecoration(labelText: '설명'),
                        )
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                        child: Text('추가'),
                        onPressed: () {
                          setState(() {
                            print("[UI] ADD");
                            todoDefault.addTodo(
                              Todo(title: title, description: description),
                            );
                          });
                          Navigator.of(context).pop();
                        }),
                    TextButton(
                        child: Text('취소'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        }),
                  ],
                );
              });
        },
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.separated(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index].title),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return SimpleDialog(
                            title: Text('할 일'),
                            children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('제목 : ' + todos[index].title),
                              ),
                              Container(
                                padding: EdgeInsets.all(10),
                                child: Text('설명 : ' + todos[index].description),
                              ),
                            ],
                          );
                        });
                  },
                  trailing: Container(
                    width: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          child: InkWell(
                            child: Icon(Icons.edit),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    String title = todos[index].title;
                                    String description =
                                        todos[index].description;
                                    return AlertDialog(
                                      title: Text('할 일 수정하기'),
                                      content: Container(
                                        height: 200,
                                        child: Column(
                                          children: [
                                            TextField(
                                              onChanged: (value) {
                                                title = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText: todos[index].title,
                                              ),
                                            ),
                                            TextField(
                                              onChanged: (value) {
                                                description = value;
                                              },
                                              decoration: InputDecoration(
                                                hintText:
                                                    todos[index].description,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        TextButton(
                                            child: Text('수정'),
                                            onPressed: () async {
                                              Todo newTodo = Todo(
                                                id: todos[index].id,
                                                title: title,
                                                description: description,
                                              );
                                              setState(() {
                                                todoDefault.updateTodo(newTodo);
                                              });
                                              Navigator.of(context).pop();
                                            }),
                                        TextButton(
                                            child: Text('취소'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          child: InkWell(
                            child: Icon(Icons.delete),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('할 일 삭제하기'),
                                      content: Container(
                                        child: Text('삭제하시겠습니까?'),
                                      ),
                                      actions: [
                                        TextButton(
                                            child: Text('삭제'),
                                            onPressed: () async {
                                              setState(() {
                                                todoDefault.deleteTodo(
                                                    todos[index].id ?? 0);
                                              });
                                              Navigator.of(context).pop();
                                            }),
                                        TextButton(
                                            child: Text('취소'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            }),
                                      ],
                                    );
                                  });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
    );
  }
}
