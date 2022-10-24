import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:statemanager/components/app_drawer.dart';
import 'package:statemanager/utils/app_routes.dart';

import '../components/badge.dart';
import '../components/product_grid.dart';
import '../models/cart.dart';

enum FilterOptions { Favorite, All }

class ProductOverViewPage extends StatefulWidget {
  const ProductOverViewPage({super.key});

  @override
  State<ProductOverViewPage> createState() => _ProductOverViewPageState();
}

class _ProductOverViewPageState extends State<ProductOverViewPage> {
  bool _showFavoriteOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha loja'),
        actions: [
          PopupMenuButton(
            itemBuilder: (_) => [
              const PopupMenuItem(
                value: FilterOptions.Favorite,
                child: Text('Somente Favoritos'),
              ),
              const PopupMenuItem(
                value: FilterOptions.All,
                child: Text('Todos'),
              )
            ],
            onSelected: ((FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorite) {
                  _showFavoriteOnly = true;
                } else {
                  _showFavoriteOnly = false;
                }
              });
            }),
          ),
          Consumer<Cart>(
            child: IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed(AppRoutes.CART);
              }),
              icon: const Icon(Icons.shopping_cart),
            ),
            builder: (context, cart, child) =>
                Badge(value: cart.itensCount.toString(), child: child!),
          )
        ],
      ),
      body: ProductGrid(_showFavoriteOnly),
      drawer: const AppDrawer(),
    );
  }
}
