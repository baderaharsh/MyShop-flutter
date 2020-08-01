import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: <Widget>[
        AppBar(
          title: Text('Welcome!'),
          automaticallyImplyLeading: false,
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.store,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Shop',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed('/');
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.payment,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Orders',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pushReplacementNamed(OrderScreen.pageRoute);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.edit,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Manage Products',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context)
                .pushReplacementNamed(UserProdictsScreen.pageRoute);
          },
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            'Logout',
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () {
            Navigator.of(context).pop();
            Navigator.of(context).pushReplacementNamed('/');
            Provider.of<Auth>(context, listen: false).logout();
          },
        ),
        Divider()
      ],
    ));
  }
}
