// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/constants.dart';
import '../../../provider/app_provider.dart';

class SingleFavouriteItem extends StatefulWidget {
  final ProductModel singleProduct;
  const SingleFavouriteItem({super.key, required this.singleProduct});

  @override
  State<SingleFavouriteItem> createState() => _SingleFavouriteItemState();
}

class _SingleFavouriteItemState extends State<SingleFavouriteItem> {
  // int qty = 1;
  // @override
  // void initState() {
  //   qty = widget.singleProduct.qty ?? 1;
  //   setState(() {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: BorderRadius.circular(12.0),
        border: Border.all(color: Colors.grey.shade200, width: 1.3),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 180,
              child: Image.network(
                widget.singleProduct.image,
                fit: BoxFit.cover,
              ),
              // color: Colors.red.withOpacity(0.8)
            ),
          ),

          Expanded(
            flex: 2,
            child: Container(
              height: 180,
              // color: Colors.red.withOpacity(0.8)
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0, left: 8.0, top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.singleProduct.name,
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            "Ksh. ${widget.singleProduct.price.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: 17.0,
                              color: Colors.black54,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     CupertinoButton(
                          //       onPressed: () {
                          //         if (qty >= 1) {
                          //           setState(() {
                          //             qty--;
                          //           });
                          //         }
                          //       },
                          //       padding: EdgeInsets.zero,
                          //       child: const CircleAvatar(
                          //         maxRadius: 12.0,
                          //         child: Icon(Icons.remove),
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 12.0,
                          //     ),
                          //     Text(
                          //       qty.toString(),
                          //       style: const TextStyle(
                          //         fontSize: 22,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //     const SizedBox(
                          //       width: 12.0,
                          //     ),
                          //     CupertinoButton(
                          //       onPressed: () {
                          //         setState(() {
                          //           qty++;
                          //         });
                          //       },
                          //       padding: EdgeInsets.zero,
                          //       child: const CircleAvatar(
                          //         maxRadius: 12.0,
                          //         child: Icon(Icons.add),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                              CupertinoButton(
                                onPressed: () {
                                   AppProvider appProvider =
                                      Provider.of<AppProvider>(context,
                                          listen: false);
                                  appProvider.removeFavouriteProduct(
                                      widget.singleProduct);
                                  showMessage(
                                      "${widget.singleProduct.name} :Removed from Favorites");
                                },
                                child: Text("Remove from Wishlist"),
                              ),
                              // IconButton(
                              //   //delete button
                              //   onPressed: () {
                              //     AppProvider appProvider =
                              //         Provider.of<AppProvider>(context,
                              //             listen: false);
                              //     appProvider.removeFavouriteProduct(
                              //         widget.singleProduct);
                              //     showMessage(
                              //         "${widget.singleProduct.name} :Removed from Favorites");
                              //   },
                              //   icon: Icon(
                              //     Icons.delete,
                              //     color: Colors.red[300],
                              //   ),
                              // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Image.network("https://cdn4.vectorstock.com/i/1000x1000/18/88/comic-book-cover-comics-books-title-page-funny-vector-23571888.jpg"),
        ],
      ),
    );
    ;
  }
}
