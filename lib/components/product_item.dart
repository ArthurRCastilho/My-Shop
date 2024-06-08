import 'package:flutter/material.dart';
import 'package:myshop/models/product.dart';
import 'package:myshop/models/product_list.dart';
import 'package:myshop/utils/app_routes.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  const ProductItem(
    this.product, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(product.imageUrl),
      ),
      title: Text(product.name),
      trailing: SizedBox(
        width: 100,
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.PRODUCT_FORM,
                  arguments: product,
                );
              },
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
            ),
            IconButton(
              onPressed: () {
                showDialog<bool>(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text('Excluir Produto?'),
                    content: Text('Tem certeza que deseja excluir o produto?'),
                    actions: [
                      TextButton(
                        child: Text('não'),
                        onPressed: () {
                          Provider.of<ProductList>(
                            context,
                            listen: false,
                          ).removeProduct(product);
                          Navigator.of(context).pop(true);
                        },
                      ),
                      TextButton(
                        child: const Text('Sim'),
                        onPressed: () {
                          Provider.of<ProductList>(
                            context,
                            listen: false,
                          ).removeProduct(product);
                          Navigator.of(context).pop(false);
                        },
                      ),
                    ],
                  ),
                ).then((value) {
                  if (value ?? false) {
                    Provider.of<ProductList>(
                      context,
                      listen: false,
                    ).removeProduct(product);
                  }
                });
              },
              icon: Icon(
                Icons.delete,
                color: Theme.of(context).colorScheme.error,
              ),
            )
          ],
        ),
      ),
    );
  }
}
