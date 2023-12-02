import 'package:comicsduka/constants/constants.dart';
import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:comicsduka/provider/app_provider.dart';
import 'package:comicsduka/screens/buy_product/buy_product.dart';
import 'package:comicsduka/screens/cart_screen/cart_screen.dart';
import 'package:comicsduka/screens/favourite_screen/favourite_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Routes.instance
                  .push(widget: const CartScreen(), context: context);
            },
            icon: const Icon(Icons.shopping_cart),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.network(
                  widget.singleProduct.image,
                  height: 300,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          widget.singleProduct.isFavorite =
                              !widget.singleProduct.isFavorite;
                        });
                        if (widget.singleProduct.isFavorite) {
                          appProvider.addFavouriteProduct(widget.singleProduct);
                          showMessage(
                              "${widget.singleProduct.name} :Added to Wishlist");
                        } else {
                          appProvider
                              .removeFavouriteProduct(widget.singleProduct);
                               showMessage(
                              "${widget.singleProduct.name} :Removed from Wishlist");
                        }
                      },
                      icon: Icon(appProvider.getFavouriteProductList
                              .contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border))
                ],
              ),
              Text(
                "Ksh. ${widget.singleProduct.price.toStringAsFixed(2)}",
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Text(widget.singleProduct.description),
              const SizedBox(
                height: 12.0,
              ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      if (qty >= 1) {
                        setState(() {
                          qty--;
                        });
                      }
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.remove),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      child: Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              // const Spacer(),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      appProvider =
                          Provider.of<AppProvider>(context, listen: false);
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage(
                          "${widget.singleProduct.name} :Added to Cart");
                    },
                    child: const Text("A D D  T O  C A R T"),
                  ),
                  // const SizedBox(
                  //   width: 24.0,
                  // ),
                  SizedBox(
                    height: 38,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        Routes.instance.push(
                            widget: const CheckOut(), context: context);
                      },
                      child: const Text(" B U Y"),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
