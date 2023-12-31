// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:comicsduka/models/category_model/category_model.dart';
import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:comicsduka/provider/app_provider.dart';
import 'package:comicsduka/screens/cart_screen/cart_screen.dart';
import 'package:comicsduka/screens/category_view/category_view.dart';
import 'package:comicsduka/screens/product_details/product_details.dart';
// import 'package:comicsduka/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// import '../../firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categoriesList = [];
  List<ProductModel> productModelList = [];

  bool isLoading = false;

  @override
  void initState() {
    AppProvider appProvider = Provider.of<AppProvider>(context, listen: false);
    appProvider.getUserInfoFirebase();
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    FirebaseFirestoreHelper.instance.updateTokenFromFirebase();
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();
    // productModelList.shuffle();

    setState(() {
      isLoading = false;
    });
  }

  TextEditingController search = TextEditingController();
  List<ProductModel> searchList = [];
void searchProducts(String value) {
  searchList = productModelList
      .where((element) => element.name.toLowerCase().contains(value.toLowerCase()))
      .toList();
  setState(() {});
}

  Widget build(BuildContext context) {
    //to set height of comic cards
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ComicsDuka",
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Routes.instance.push(widget: CartScreen(), context: context);
                  // FirebaseAuthHelper.instance.signOut();

                  //     setState(() {});
                },
                child: Icon(
                  Icons.shopping_cart_checkout_outlined,
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
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              // scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const TopTitles(title: "Comics Duka", subtitle: ""),

                        TextFormField(
                          controller: search,
                          onChanged: (String value) {
                            searchProducts(value);
                          },
                          decoration: InputDecoration(
                            hintText: "Search...",
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Categories",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categoriesList
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: CupertinoButton(
                                padding: EdgeInsets.zero,
                                onPressed: () {
                                  Routes.instance.push(
                                      widget: CategoryView(categoryModel: e),
                                      context: context);
                                },
                                child: Card(
                                  color: Colors.white,
                                  elevation: 3.0,
                                  // shape: RoundedRectangleBorder(
                                  //     borderRadius:
                                  //         BorderRadius.circular(20.0)),
                                  child: Container(
                                    height: 120,
                                    width: 100,
                                    child: Image.network(e.image),
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  !isSearched()? Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Popular Comics",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ):SizedBox.fromSize(),
                  search.text.isNotEmpty && searchList.isEmpty
                      ? Center(
                          child: Text("No Comics Available"),
                        )
                      : searchList.isNotEmpty
                          ? Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: GridView.builder(
                                physics: ScrollPhysics(),
                                shrinkWrap: true,
                                primary: false,
                                itemCount: searchList.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: (itemWidth / itemHeight),
                                ),
                                itemBuilder: (ctx, index) {
                                  ProductModel singleProduct =
                                      searchList[index];

                                  return Card(
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    child: Hero(
                                        tag: singleProduct.id,
                                        child: Material(
                                          child: InkWell(
                                            onTap: () {
                                              Routes.instance.push(
                                                  widget: ProductDetails(
                                                    singleProduct:
                                                        singleProduct,
                                                  ),
                                                  context: context);
                                            },
                                            child: GridTile(
                                              footer: Container(
                                                color: Colors.white70,
                                                child: ListTile(
                                                  leading: Text(
                                                    "KSh. ${singleProduct.price.toStringAsFixed(2)}",
                                                    style: TextStyle(
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
                            )
                          : productModelList.isEmpty
                              ? Center(
                                  child: Text("No Comics Currently"),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: GridView.builder(
                                    physics: ScrollPhysics(),
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: productModelList.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio:
                                          (itemWidth / itemHeight),
                                    ),
                                    itemBuilder: (ctx, index) {
                                      ProductModel singleProduct =
                                          productModelList[index];

                                      return Card(
                                        elevation: 5.0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20.0)),
                                        child: Hero(
                                            tag: singleProduct.id,
                                            child: Material(
                                              child: InkWell(
                                                onTap: () {
                                                  Routes.instance.push(
                                                      widget: ProductDetails(
                                                        singleProduct:
                                                            singleProduct,
                                                      ),
                                                      context: context);
                                                },
                                                child: GridTile(
                                                  footer: Container(
                                                    color: Colors.white70,
                                                    child: ListTile(
                                                      leading: Text(
                                                        "KSh. ${singleProduct.price.toStringAsFixed(2)}",
                                                        // singleProduct.name,
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
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
                ],
              ),
            ),
    );
  }

  bool isSearched() {
    if (search.text.isNotEmpty && searchList.isEmpty) {
      return true;
    } else if (search.text.isEmpty && searchList.isNotEmpty) {
      return false;
    } else if (searchList.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
