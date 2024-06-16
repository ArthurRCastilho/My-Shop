import 'package:flutter/material.dart';
import 'package:myshop/models/auth.dart';
import 'package:myshop/screens/auth_screen.dart';
import 'package:myshop/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

class AuthOrHomeScreen extends StatelessWidget {
  const AuthOrHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Auth auth = Provider.of(context);
    return auth.isAuth ? ProductsOverviewScreen() : const AuthScreen();
  }
}
