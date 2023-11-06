// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/models/product_model/product_model.dart';
import 'package:comicsduka/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
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
                            child: Image.network(e),
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            GridView.builder(
              shrinkWrap: true,
              itemCount: bestProducts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (ctx, index) {
                ProductModel singleProduct = bestProducts[index];
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

                return Card(
                  child: Hero(
                      tag: singleProduct.name,
                      child: Material(
                        child: InkWell(
                          onTap: () {

                          },
                          child: GridTile(
                              footer: Container(
                                color: Colors.white70,
                                child: ListTile(
                                  leading: Text(
                                    singleProduct.name,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  title: Text("Ksh. ${singleProduct.price}"),
                                  subtitle: Text(""),
                                ),
                              ),
                              child: Image.network(singleProduct.image)),
                        ),
                      )),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

List<String> categoriesList = [
  "https://upload.wikimedia.org/wikipedia/commons/thumb/1/1c/DC_Comics_logo.png/768px-DC_Comics_logo.png",
  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b9/Marvel_Logo.svg/1280px-Marvel_Logo.svg.png",
  "https://seeklogo.com/images/M/manga-logo-26D5521A34-seeklogo.com.png",
  "https://upload.wikimedia.org/wikipedia/commons/0/09/Naver_Line_Webtoon_logo.png",
  "https://indiecomicszone.com/wp-content/uploads/2022/06/logo-black-220.png"
];

List<String> titles = [
  'DC Comics',
  'Marvel',
  'Manga',
  'Webtoons',
  'Indie',
];

List<ProductModel> bestProducts = [
  ProductModel(
    id: "1",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
  ProductModel(
    id: "2",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
  ProductModel(
    id: "3",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
  ProductModel(
    id: "4",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
  ProductModel(
    id: "5",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
  ProductModel(
    id: "6",
    image:
        "https://i0.wp.com/ultimatecomics.com/wp-content/uploads/2021/06/Scan2021-06-03_125144.jpg?fit=1948%2C2972&ssl=1",
    name: "Batman",
    price: "20",
    description:
        "Batman is a superhero who fights crime and protects Gotham City from villains like the Joker and Harley Quinn, using his intelligence, martial arts skills, and gadgets like his Batmobile and Batwing. He is also a billionaire philanthropist named Bruce Wayne, who wears a bat-themed costume to keep his identity hidden.",
    status: "pending",
    isFavorite: false,
  ),
];
