import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall/models/model_item_provider.dart';
import 'package:flutter_shopping_mall/models/model_query.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemProvider>(context);
    final searchQuery = Provider.of<SearchQuery>(context);
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            TextField(
              onChanged: (text) {
                searchQuery.updateText(text);
              },
              autofocus: true,
              decoration: InputDecoration(
                hintText: '검색어를 입력하세요.',
                border: InputBorder.none,
              ),
              maxLines: 1,
              cursorColor: Colors.grey,
              cursorWidth: 1.5,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {
              itemProvider.search(searchQuery.text);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                ),
                itemCount: itemProvider.searchItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return GridTile(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: itemProvider.searchItems[index]);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                                itemProvider.searchItems[index].imageUrl),
                            Text(
                              itemProvider.searchItems[index].title,
                              style: TextStyle(fontSize: 18),
                            ),
                            Text(
                                itemProvider.searchItems[index].price
                                        .toString() +
                                    '원',
                                style:
                                    TextStyle(fontSize: 16, color: Colors.red)),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
