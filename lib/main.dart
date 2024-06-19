import 'package:flutter/material.dart';
import 'package:myshop/models/auth.dart';
import 'package:myshop/models/cart.dart';
import 'package:myshop/models/order_list.dart';
import 'package:myshop/models/product_list.dart';
import 'package:myshop/screens/auth_or_home_screen.dart';
import 'package:myshop/screens/cart_screen.dart';
import 'package:myshop/screens/orders_screen.dart';
import 'package:myshop/screens/product_detail_screen.dart';
import 'package:myshop/screens/product_form_screen.dart';
import 'package:myshop/screens/products_screen.dart';
import 'package:myshop/utils/app_routes.dart';
import 'package:myshop/utils/custom_route.dart';
import 'package:provider/provider.dart';

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
          create: (_) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, ProductList>(
          create: (_) => ProductList(),
          update: (ctx, auth, previous) {
            return ProductList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProxyProvider<Auth, OrderList>(
          create: (_) => OrderList(),
          update: (ctx, auth, previous) {
            return OrderList(
              auth.token ?? '',
              auth.userId ?? '',
              previous?.items ?? [],
            );
          },
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.purple,
          colorScheme: Theme.of(context).colorScheme.copyWith(
                secondary: Colors.deepOrange,
                tertiary: Colors.white,
              ),
          fontFamily: 'Lato',
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Colors.purple,
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontFamily: 'lato',
              fontSize: 22,
            ),
          ),
          pageTransitionsTheme: PageTransitionsTheme(
            builders: {
              TargetPlatform.iOS: CustomPageTransitionBuilder(),
              TargetPlatform.android: CustomPageTransitionBuilder(),
            },
          ),
        ),
        // home: ProductsOverviewScreen(),
        routes: {
          AppRoutes.AUTH_OR_HOME: (ctx) => const AuthOrHomeScreen(),
          AppRoutes.PRODUCT_DETAIL: (ctx) => const ProductDetailScreen(),
          AppRoutes.CART: (ctx) => const CartScreen(),
          AppRoutes.ORDERS: (ctx) => const OrdersScreen(),
          AppRoutes.PRODUCTS_SCREEN: (ctx) => const ProductsScreen(),
          AppRoutes.PRODUCT_FORM: (ctx) => const ProductFormScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
