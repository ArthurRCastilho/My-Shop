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
    return FutureBuilder(
      future: auth.tryAutoLogin(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.error != null) {
          return const Center(
            child: Text('Ocorreu um erro'),
          );
        } else {
          return auth.isAuth ? ProductsOverviewScreen() : const AuthScreen();
        }
      },
    );
  }
}
