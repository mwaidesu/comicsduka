// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:comicsduka/models/category_model/category_model.dart';
import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:comicsduka/screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import '../../constants/routes.dart';
import '../product_details/product_details.dart';

class CategoryView extends StatefulWidget {
  final CategoryModel categoryModel;
  const CategoryView({super.key, required this.categoryModel});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  List<ProductModel> productModelList = [];

  bool isLoading = false;
  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    productModelList = await FirebaseFirestoreHelper.instance
        .getCategoryViewProduct(widget.categoryModel.id);
    productModelList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    getCategoryList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.categoryModel.name,
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Routes.instance.push(widget: CartScreen(), context: context);
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 26.0,
                ),
              )),
        ],
      ),
      body: isLoading
          ? Center(
              child: Container(
                height: 100,
                width: 100,
                alignment: Alignment.center,
                child: const CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const SizedBox(height: kToolbarHeight * 1),
                  // Padding(
                  //   padding: const EdgeInsets.all(12.0),
                  //   child:
                  // Row(
                  //   children: [
                  //     const BackButton(),
                  //     Text(
                  //       widget.categoryModel.name,
                  //       style: const TextStyle(
                  //         fontSize: 18.0,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // ),
                  productModelList.isEmpty
                      ? const Center(
                          child: Text("Best Product is empty"),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: GridView.builder(
                            physics: const ScrollPhysics(),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: productModelList.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: (itemWidth / itemHeight),
                            ),
                            itemBuilder: (ctx, index) {
                              ProductModel singleProduct =
                                  productModelList[index];

                              return Card(
                                elevation: 5.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Hero(
                                    tag: singleProduct.id,
                                    child: Material(
                                      child: InkWell(
                                        onTap: () {
                                          Routes.instance.push(
                                              widget: ProductDetails(
                                                singleProduct: singleProduct,
                                              ),
                                              context: context);
                                        },
                                        child: GridTile(
                                          footer: Container(
                                            color: Colors.white70,
                                            child: ListTile(
                                              leading: Text(
                                                "KSh. ${singleProduct.price}",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          child: Image.network(
                                            singleProduct.image,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    )),
                              );
                            },
                          ),
                        ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            ),
    );
  }
}
