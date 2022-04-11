import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall/models/model_item.dart';

class ItemProvider with ChangeNotifier {
  late CollectionReference itemsReference;
  List<Item> items = [];
  List<Item> searchItems = [];

  ItemProvider({reference}) {
    itemsReference =
        reference ?? FirebaseFirestore.instance.collection('items');
  }

  Future<void> fetchItems() async {
    items = await itemsReference.get().then((QuerySnapshot results) {
      return results.docs.map((DocumentSnapshot document) {
        return Item.fromSnapshot(document);
      }).toList();
    });
    notifyListeners();
  }

  Future<void> search(String query) async {
    searchItems = [];
    if (query.length == 0) {
      return;
    }
    for (Item item in items) {
      if (item.title.contains(query)) {
        searchItems.add(item);
      }
    }
    notifyListeners();
  }
}
