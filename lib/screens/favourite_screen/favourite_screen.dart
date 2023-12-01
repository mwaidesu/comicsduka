import 'package:comicsduka/screens/favourite_screen/widgets/single_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/app_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(
      context,
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Wishlist",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: appProvider.getFavouriteProductList.isEmpty
          ? Center(
              child: Text(
                "Your Wishlist is Empty",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.red[300]),
              ),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(12.0),
              itemCount: appProvider.getFavouriteProductList.length,
              itemBuilder: (ctx, index) {
                return SingleFavouriteItem(
                  singleProduct: appProvider.getFavouriteProductList[index],
                );
              }),
    );
  }
}
