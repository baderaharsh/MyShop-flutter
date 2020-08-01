import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/cart.dart';

class CartItemList extends StatelessWidget {
  final String id;
  final int quantity;
  CartItemList(this.id, this.quantity);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context)
        .items
        .firstWhere((element) => element.id == id);
    return Dismissible(
      key: ValueKey(id),
      background: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        padding: EdgeInsets.only(right: 20),
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        color: Theme.of(context).errorColor,
      ),
      direction: DismissDirection.endToStart,
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Are you sure?'),
                  content: Text(
                      'Do you want to remove ${product.title} from the cart?'),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(false);
                      },
                      child: Text('No'),
                    ),
                    FlatButton(
                      onPressed: () {
                        Navigator.of(ctx).pop(true);
                      },
                      child: Text('Yes'),
                    ),
                  ],
                ));
      },
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(product.id);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                product.imageUrl,
              ),
            ),
            title: Text(product.title),
            subtitle: Text('$quantity x \$${product.price}'),
            trailing: Text('\$${quantity * product.price}'),
          ),
        ),
      ),
    );
  }
}
