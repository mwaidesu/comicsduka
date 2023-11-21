// ignore_for_file: prefer_const_constructors, unnecessary_const

import 'package:comicsduka/widgets/single_cart_item/single_cart_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Cart Screen",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(12.0),
          itemCount: 4,
          itemBuilder: (ctx, index) {
            return SingleCartItem();
          }),
    );
  }
}
