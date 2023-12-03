// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:flutter/material.dart';
import '../../models/order_model/order_model.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});
  Future<void> _handleRefresh() async {
    // FirebaseFirestoreHelper.instance.getUserOrder(context);
    return await Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Your Orders",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handleRefresh,
        height: 300, 
        animSpeedFactor: 2,
        backgroundColor: Colors.red[300],
        child: StreamBuilder(
          stream: Stream.fromFuture(
              FirebaseFirestoreHelper.instance.getUserOrder(context)),
          // future: FirebaseFirestoreHelper.instance.getUserOrder(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.data!.isEmpty ||
                snapshot.data == null ||
                !snapshot.hasData) {
              return const Center(
                child: Text("No Order Found"),
              );
            }

            return Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                padding: const EdgeInsets.all(12.0),
                itemBuilder: (context, index) {
                  OrderModel orderModel = snapshot.data![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: ExpansionTile(
                      tilePadding: EdgeInsets.zero,
                      collapsedShape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.grey, width: 2.3)),
                      // side: BorderSide(color:Theme.of(context).primaryColor, width: 2.3)),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: Theme.of(context).primaryColor,
                              width: 2.3)),
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Container(
                            height: 180,
                            width: 120,
                            // color:Theme.of(context).primaryColor.withOpacity(0.5),
                            child: Image.network(
                              orderModel.products[0].image,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  orderModel.products[0].name,
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                orderModel.products.length > 1
                                    ? SizedBox.fromSize()
                                    : Column(
                                        children: [
                                          Text(
                                            "Quanity: ${orderModel.products[0].qty.toString()}",
                                            style: const TextStyle(
                                              fontSize: 12.0,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 12.0,
                                          ),
                                        ],
                                      ),
                                Text(
                                  "Total Price: \$${orderModel.totalPrice.toString()}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Text(
                                  "Order Status: ${orderModel.status}",
                                  style: const TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      children: orderModel.products.length > 1
                          ? [
                              const Text("Details"),
                              Divider(color: Theme.of(context).primaryColor),
                              ...orderModel.products.map((singleProduct) {
                                return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, top: 6.0),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.alphabetic,
                                        children: [
                                          Container(
                                            height: 120,
                                            width: 80,
                                            color: Theme.of(context)
                                                .primaryColor
                                                .withOpacity(0.5),
                                            child: Image.network(
                                              singleProduct.image,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  singleProduct.name,
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  height: 12.0,
                                                ),
                                                Column(
                                                  children: [
                                                    Text(
                                                      "Quanity: ${singleProduct.qty.toString()}",
                                                      style: const TextStyle(
                                                        fontSize: 12.0,
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 12.0,
                                                    ),
                                                  ],
                                                ),
                                                Text(
                                                  "Price: \$${singleProduct.price.toString()}",
                                                  style: const TextStyle(
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Divider(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ],
                                  ),
                                );
                              }).toList()
                            ]
                          : [],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
