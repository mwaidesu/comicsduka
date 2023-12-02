// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:comicsduka/provider/app_provider.dart';
import 'package:comicsduka/widgets/single_cart_item/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/order_model/order_model.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            " Your Orders",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: FirebaseFirestoreHelper.instance.getUserOrder(context),
          builder: ((context, snapshot) {

            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.data!.isEmpty || snapshot.data == null || !snapshot.hasData) {
              return Center(
                child: Text("No Orders",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red[300]),),
              );
            }
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                      collapsedShape: const RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey)
                      ),
                      title: Text(
                        orderModel.products[0].name,
                        style: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w500),
                      ),
                      children: 
                      <Widget>[
                        ListTile(
                          title: Text(
                            orderModel.payment,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            
                            "Ksh. ${orderModel.totalPrice.toString()}",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                        ListTile(
                          title: Text(
                            orderModel.status,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          subtitle: Text(
                            "Order ID: ${orderModel.orderId}",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                                                ListTile(
                          title: Text(
                            "Quantity: ${orderModel.products[0].qty.toString()}",
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          // subtitle: Text(
                          //   "Order ID: ${orderModel.orderId}",
                          //   style: TextStyle(fontWeight: FontWeight.w700),
                          // ),
                        ),

                      ],
                    ),
                  );
                });
          }),
        ));
  }
}
