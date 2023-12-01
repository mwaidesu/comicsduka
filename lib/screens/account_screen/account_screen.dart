// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/widgets/primary_button/primary_button.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: const Text(
            "Account",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: Column(
                children:[
                  Icon(
                    Icons.person_outline,
                    size: 100,
                  ),
                  Text(
                    "Test User",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text("testuser@gmail.com"),

                  SizedBox(height: 12,),
                  SizedBox(
                    width: 200,
                    child: PrimaryButton(title: "Edit Profile", onPressed:(){},),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.shopping_bag_outlined),
                    title: Text("Your Orders"),
                  ),
                  ListTile(
                    leading: Icon(Icons.favorite_outline),
                    title: Text("Wishlist"),
                  ),
                  ListTile(
                    leading: Icon(Icons.info_outline),
                    title: Text("About Us"),
                  ),
                  ListTile(
                    leading: Icon(Icons.support),
                    title: Text("Support"),
                  ),

                  ListTile(
                    leading: Icon(Icons.logout_outlined),
                    title: Text("Log Out"),
                  ),
                  SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "ComicsDuka v1.0.0",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
