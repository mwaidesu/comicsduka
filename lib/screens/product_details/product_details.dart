import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(singleProduct.image)
        ],
      ),
    );
  }
}
