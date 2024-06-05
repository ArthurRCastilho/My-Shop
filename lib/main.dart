import 'package:flutter/material.dart';
import 'package:myshop/models/product_list.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:myshop/screens/products_overview_screen.dart';
import 'package:myshop/utils/app_routes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductList(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: Colors.deepOrange,
              ),
          fontFamily: 'Lato',
        ),
        home: const ProductsOverviewScreen(),
        routes: {
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
