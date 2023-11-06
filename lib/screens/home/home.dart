// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/widgets/top_titles/top_titles.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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

        ],
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
