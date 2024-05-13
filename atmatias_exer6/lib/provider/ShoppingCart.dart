import "package:flutter/material.dart";
import "../model/Item.dart";

class ShoppingCart extends ChangeNotifier {
  //list of items added
  List<Item> _shoppingList = [];

  List<Item> get cart => _shoppingList;

  //function for adding item to cart
  void addItem(Item item) {
    _shoppingList.add(item);
    notifyListeners();
  }

  //function for removing item from cart
  void removeItem(Item item) {
    _shoppingList.remove(item);
    notifyListeners();
  }

  //function for getting total cost
  double getTotal() {
    double total = 0;
    for (int i = 0; i < _shoppingList.length;i++) {
      total = total + _shoppingList[i].price;
    }
    return total;
  }

  //function for removing all items from cart
  void removeAll() {
    _shoppingList.clear();
    notifyListeners();
  }
}
