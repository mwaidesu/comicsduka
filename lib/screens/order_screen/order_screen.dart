// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/provider/app_provider.dart';
import 'package:comicsduka/widgets/single_cart_item/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(" Your Orders", style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),),
        
      ),
            body: appProvider.getCartProductList.isEmpty? Center(child: Text("Order page is Empty", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red[300]),),): ListView.builder(
          padding: const EdgeInsets.all(12.0),

          itemCount: appProvider.getCartProductList.length,
          itemBuilder: (ctx, index) {
            return SingleCartItem(singleProduct: appProvider.getCartProductList[index],);
          })
    );
  }
}