// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:comicsduka/widgets/single_cart_item/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context,);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: appProvider.getCartProductList.isEmpty? Center(child: Text("Cart is Empty", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.red[300]),),): ListView.builder(
          padding: const EdgeInsets.all(12.0),

          itemCount: appProvider.getCartProductList.length,
          itemBuilder: (ctx, index) {
            return SingleCartItem(singleProduct: appProvider.getCartProductList[index],);
          }),
    );
  }
}
