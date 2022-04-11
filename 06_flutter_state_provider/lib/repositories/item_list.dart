import 'package:flutter_state_provider/models/item.dart';

class ItemList {
  final List<Item> items = [
    Item(id: 1, title: '1번 상품', price: 1000),
    Item(id: 2, title: '2번 상품', price: 1500),
    Item(id: 3, title: '3번 상품', price: 2000),
    Item(id: 4, title: '4번 상품', price: 3000),
    Item(id: 5, title: '5번 상품', price: 4000),
    Item(id: 6, title: '6번 상품', price: 5000),
  ];

  List<Item> getItems() {
    return items;
  }
}
