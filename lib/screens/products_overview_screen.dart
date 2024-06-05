import 'package:flutter/material.dart';
import 'package:myshop/components/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [],
        title: Text('Minha Loja'),
      ),
      body: ProductGrid(),
    );
  }
}
