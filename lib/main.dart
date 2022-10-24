import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanager/models/cart.dart';
import 'package:statemanager/models/order_list.dart';
import 'package:statemanager/pages/cart_page.dart';
import 'package:statemanager/pages/orders_page.dart';
import 'package:statemanager/pages/product_detail_page.dart';
import 'package:statemanager/pages/products_overview_page.dart';
import 'package:statemanager/utils/app_routes.dart';

import 'models/product_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductList(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => OrderList(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.deepOrange),
            fontFamily: 'Lato'),
        // home: ProductOverViewPage(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: ((context) => const ProductDetailPage()),
          AppRoutes.CART: ((context) => const CartPage()),
          AppRoutes.HOME: ((context) => const ProductOverViewPage()),
          AppRoutes.ORDERS: ((context) => const OrdersPage()),
        },
      ),
    );
  }
}
