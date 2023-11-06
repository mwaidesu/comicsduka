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

          // SingleChildScrollView(
          //   scrollDirection: Axis.horizontal,
          //   child: Row(children: 
          //     categoriesList.map((e) => 
          //     Padding(
          //     padding: const EdgeInsets.only(left: 8.0),
          //     child: Card(
          //       color: Colors.white,
          //       elevation: 13.0,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(20.0)),
          //       child: Container(
          //         height: 100,
          //         width: 100,
          //         child: Image.network(e),
          //       ),
          //     ),
          //   ),
          //   ).toList(),
          //   ),
          // ),


          SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: categoriesList.asMap().entries.map((entry) {
      final int index = entry.key;
      final String imageUrl = entry.value;

      return Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Card(
          color: Colors.white,
          elevation: 3.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: <Widget>[
              Container(
                height: 130,
                width: 150,
                child: Image.network(imageUrl),
              ),
              // SizedBox(height: 8.0), // Add spacing between the image and text
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  titles[index],
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      );
    }).toList(),
  ),
)

          
        ],
      ),
    );
  }
}

List<String> categoriesList = [
  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfdAZFZGOIxL3eEEjkiorv8lH5Our3D-9yASfMp4wppA&s",
  "https://www.dlf.pt/dfpng/middlepng/1-17857_captain-america-shield-png-transparent-png.png",
  "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/f05a9b5b-ead5-460e-8573-73ba2fff9cde/dcnlwkp-19df6a40-badc-4fe9-803d-9da05f5c68bc.png/v1/fill/w_1600,h_1237/akatsuki_cloud_png_by_chanxgg_dcnlwkp-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9MTIzNyIsInBhdGgiOiJcL2ZcL2YwNWE5YjViLWVhZDUtNDYwZS04NTczLTczYmEyZmZmOWNkZVwvZGNubHdrcC0xOWRmNmE0MC1iYWRjLTRmZTktODAzZC05ZGEwNWY1YzY4YmMucG5nIiwid2lkdGgiOiI8PTE2MDAifV1dLCJhdWQiOlsidXJuOnNlcnZpY2U6aW1hZ2Uub3BlcmF0aW9ucyJdfQ.boOIlfNZMoKSfgoa3iXmZEM4bT79B9TTEb_qZb-3h6M",

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
