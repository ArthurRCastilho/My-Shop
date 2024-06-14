import 'package:flutter/material.dart';
import 'package:myshop/models/cart.dart';
import 'package:myshop/models/order_list.dart';
import 'package:provider/provider.dart';

class CartButton extends StatefulWidget {
  const CartButton({
    super.key,
    required this.cart,
  });

  final Cart cart;

  @override
  State<CartButton> createState() => _CartButtonState();
}

class _CartButtonState extends State<CartButton> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const CircularProgressIndicator()
        : TextButton(
            onPressed: widget.cart.itemsCount == 0
                ? null
                : () async {
                    setState(() => _isLoading = true);
                    await Provider.of<OrderList>(
                      context,
                      listen: false,
                    ).addOrder(widget.cart);

                    widget.cart.clear();
                    setState(() => _isLoading = false);
                  },
            style: TextButton.styleFrom(
                textStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            )),
            child: const Text('COMPRAR'),
          );
  }
}
