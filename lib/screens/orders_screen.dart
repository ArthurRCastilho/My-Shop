import 'package:flutter/material.dart';
import 'package:myshop/components/app_drawer.dart';
import 'package:myshop/components/order.dart';
import 'package:myshop/models/order_list.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final OrderList orders = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Meus Pedidos'),
      ),
      body: orders.itemsCount == 0
          ? const Center(
              child: Text('Você não fez nenhuma transação ainda!'),
            )
          : ListView.builder(
              itemCount: orders.itemsCount,
              itemBuilder: (ctx, i) => OrderWidget(orders.items[i])),
      drawer: const AppDrawer(),
    );
  }
}
