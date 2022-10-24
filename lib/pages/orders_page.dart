import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanager/components/app_drawer.dart';
import 'package:statemanager/components/order.dart';
import 'package:statemanager/models/order_list.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Meus pedidos')),
      drawer: const AppDrawer(),
      body: ListView.builder(
          itemCount: orders.itemsCount,
          itemBuilder: (context, index) =>
              OrderWidget(order: orders.items[index])),
    );
  }
}