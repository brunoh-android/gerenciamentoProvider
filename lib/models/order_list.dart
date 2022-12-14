import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:statemanager/models/order.dart';

import 'cart.dart';

class OrderList with ChangeNotifier {
  final List<Order> _items = [];

  List<Order> get items {
    return [..._items];
  }

  int get itemsCount {
    return _items.length;
  }

  void addOrder(Cart cart) {
    _items.insert(
        0,
        Order(
            id: Random().nextDouble().toString(),
            total: cart.totalAmount,
            products: cart.itens.values.toList(),
            date: DateTime.now()));
    notifyListeners();
  }
}
