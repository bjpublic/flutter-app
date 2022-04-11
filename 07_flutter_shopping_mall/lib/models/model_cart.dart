import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shopping_mall/models/model_item.dart';

class CartProvider with ChangeNotifier {
  late CollectionReference cartReference;
  List<Item> cartItems = [];

  CartProvider({reference}) {
    cartReference = reference ?? FirebaseFirestore.instance.collection('carts');
  }

  Future<void> fetchCartItemsOrAddCart(User? user) async {
    if (user == null) {
      return;
    }
    final cartSnapshot = await cartReference.doc(user.uid).get();
    if (cartSnapshot.exists) {
      Map<String, dynamic> cartItemsMap =
          cartSnapshot.data() as Map<String, dynamic>;
      List<Item> temp = [];
      for (var item in cartItemsMap['items']) {
        temp.add(Item.fromMap(item));
      }
      cartItems = temp;
      notifyListeners();
    } else {
      await cartReference.doc(user.uid).set({'items': []});
      notifyListeners();
    }
  }

  Future<void> addItemToCart(User? user, Item item) async {
    cartItems.add(item);
    Map<String, dynamic> cartItemsMap = {
      'items': cartItems.map((item) {
        return item.toSnapshot();
      }).toList()
    };
    await cartReference.doc(user!.uid).set(cartItemsMap);
    notifyListeners();
  }

  Future<void> removeItemFromCart(User? user, Item item) async {
    cartItems.removeWhere((element) => element.id == item.id);
    Map<String, dynamic> cartItemsMap = {
      'items': cartItems.map((item) {
        return item.toSnapshot();
      }).toList()
    };
    await cartReference.doc(user!.uid).set(cartItemsMap);
    notifyListeners();
  }

  bool isItemInCart(Item item) {
    return cartItems.any((element) => element.id == item.id);
  }
}
