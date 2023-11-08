// ignore_for_file: prefer_const_constructors

// import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:ui';

import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/firebase_helper/firebase_firestore_helper/firebase_firestore.dart';
import 'package:comicsduka/models/category_model/category_model.dart';
import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:comicsduka/screens/auth_ui/sign_up/sign_up.dart';
import 'package:comicsduka/widgets/top_titles/top_titles.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
    getCategoryList();
    super.initState();
  }

  void getCategoryList() async {
    setState(() {
      isLoading = true;
    });
    categoriesList = await FirebaseFirestoreHelper.instance.getCategories();
    productModelList = await FirebaseFirestoreHelper.instance.getBestProducts();

    setState(() {
      isLoading = false;
    });
  }

  Widget build(BuildContext context) {

    //to set height of comic cards
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) /2.5;
    final double itemWidth = size.width / 2;

    return Scaffold(
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
                        const TopTitles(title: "Comics Duka", subtitle: ""),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Search...",
                            suffixIcon: Icon(Icons.search),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
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
                              child: Card(
                                color: Colors.white,
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)),
                                child: Container(
                                  height: 100,
                                  width: 100,
                                  child: Image.network(e.image),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  
                 
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: const Text(
                      "Popular Comics",
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                  ),

                   productModelList.isEmpty? Center(child: Text("No Comics Currently"),):
                   Padding(
                     padding: const EdgeInsets.all(12.0),
                     child: GridView.builder(
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productModelList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: (itemWidth / itemHeight),
                      ),
                      itemBuilder: (ctx, index) {
                        ProductModel singleProduct = productModelList[index];
                        
                        // return Container(
                        // decoration: BoxDecoration(
                        //   color: Colors.grey[100],
                        //   borderRadius: BorderRadius.circular(12),
                        // ),
                        // child: Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Column(
                        //     children: [
                        //       Image.network(
                        //         singleProduct.image,
                        //         height: 100,
                        //       ),
                        //       Text(
                        //         singleProduct.name,
                        //         style: TextStyle(fontWeight: FontWeight.bold),
                        //       ),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //         children: [
                        //           Text("KSh. ${singleProduct.price}"),
                        //           SizedBox(height: 6.0),
                        //           OutlinedButton(
                        //             onPressed: () {},
                        //             child: const Text("B U Y"),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                   
                        // );
                   
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            elevation: 5.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            child: Hero(
                                tag: singleProduct.id,
                                child: Material(
                                  child: InkWell(
                                    onTap: () {
                                      Routes.instance.push(
                                          widget: SignUp(), context: context);
                                    },
                                    child: GridTile(
                                        // footer: Container(
                                        //   color: Colors.white70,
                                          
                                        //   child: ListTile(
                                        //     leading: Text(
                                        //       singleProduct.name,
                                        //       style: TextStyle(
                                        //           fontWeight: FontWeight.bold),
                                        //     ),
                                        //     title: Text(
                                        //         "${singleProduct.price}"),
                                        //     subtitle: Text(""),
                                        //   ),
                                        // ),
                                        child:
                                            Image.network(singleProduct.image,
                                            fit: BoxFit.cover,
                                            ),
                                            ),
                                            
                                  ),
                                )),
                          ),
                        );
                      },
                                     ),
                   ),
                ],
              ),
            ),
    );
  }
}

// List<String> categoriesList = [
//   "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/DC_Comics_logo.png/768px-DC_Comics_logo.png",
//   "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/1280px-Marvel_Logo.svg.png",
//   "https://seeklogo.com/images/M/manga-logo-26D5521A34-seeklogo.com.png",
//   "https://upload.wikimedia.org/wikipedia/commons/0/09/Naver_Line_Webtoon_logo.png",
//   "https://indiecomicszone.com/wp-content/uploads/2022/06/logo-black-220.png"
// ];

List<String> titles = [
  'DC Comics',
  'Marvel',
  'Manga',
  'Webtoons',
  'Indie',
];

// List<ProductModel> bestProducts = [
//   ProductModel(
//     id: "1",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
//   ProductModel(
//     id: "2",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
//   ProductModel(
//     id: "3",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
//   ProductModel(
//     id: "4",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
//   ProductModel(
//     id: "5",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
//   ProductModel(
//     id: "6",
//     image:
//         "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
//     name: "Batman",
//     price: "20",
//     description:
//         "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
//     status: "pending",
//     isFavorite: false,
//   ),
// ];
