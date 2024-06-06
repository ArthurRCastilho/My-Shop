import 'package:flutter/material.dart';
import 'package:myshop/models/cart.dart';
import 'package:myshop/models/cart_item.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  const CartItemWidget({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      confirmDismiss: (_) {
        return Future.value(
          showDialog<bool>(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text(
                  'Tem certeza que deseja excluir este item do carrinho?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(false);
                  },
                  child: const Text('Não'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop(true);
                  },
                  child: const Text('Sim'),
                ),
              ],
            ),
          ),
        );
      },
      onDismissed: (_) {
        Provider.of<Cart>(
          context,
          listen: false,
        ).removeItem(cartItem.productId);
      },
      background: Container(
        color: Theme.of(context).colorScheme.error,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 30),
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 4,
        ),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(5),
              child: FittedBox(
                child: Text('${cartItem.price}'),
              ),
            ),
          ),
          title: Text(cartItem.name),
          subtitle: Text('Total: R\$ ${cartItem.price * cartItem.quantity}'),
          trailing: Text('${cartItem.quantity}x'),
        ),
      ),
    );
  }
}
