// ignore_for_file: unnecessary_import, prefer_const_constructors


import '../model/cardapio.dart';

class Cart {
  List<MenuItem> items = [];

  void addItem(MenuItem item) {
    items.add(item);
  }

  void removeItem(MenuItem item) {
    items.remove(item);
  }

  void clear() {
    items.clear();
  }

  double get totalPrice => items.fold(0, (sum, item) => sum + item.price);
}
