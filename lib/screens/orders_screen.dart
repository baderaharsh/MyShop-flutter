import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart' show Orders;
import '../widgets/order_item.dart';
import '../widgets/drawer.dart';

class OrderScreen extends StatelessWidget {
  static const pageRoute = '/orders';
  @override
  Widget build(BuildContext context) {
    print('called orders screen');
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Orders'),
        ),
        body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrders(),
          builder: (ctx, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSnapshot.error != null) {
                return Center(
                  child: Text('Error occured!'),
                );
              } else {
                return Consumer<Orders>(
                    builder: (ctx, ordersData, child) => ListView.builder(
                          itemCount: ordersData.orders.length,
                          itemBuilder: (ctx, index) =>
                              OrderItem(ordersData.orders[index]),
                        ));
              }
            }
          },
        ));
  }
}
