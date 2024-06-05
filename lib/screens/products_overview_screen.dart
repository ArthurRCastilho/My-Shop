import 'package:flutter/material.dart';
import 'package:myshop/components/product_grid.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: const [],
        title: const Text('Minha Loja'),
      ),
      body: const ProductGrid(),
    );
  }
}
