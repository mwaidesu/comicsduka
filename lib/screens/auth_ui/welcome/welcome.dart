import 'package:comicsduka/constants/asset_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "ComicsDuka",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            // height: kToolbarHeight +12,
            height: 12,
          ),
          const Text(
            "Get your favorite comics",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          Center(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              AssetsImages.instance.welcomeImage,
            ),
          )),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CupertinoButton(
          //       onPressed: () {},
          //       padding: EdgeInsets.zero,
          //       child: Image.asset(
          //         AssetsImages.instance.googleImage,
          //         scale: 30.0,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 12.0,
          //     ),
          //     CupertinoButton(
          //       onPressed: () {},
          //       padding: EdgeInsets.zero,
          //       child: Image.asset(
          //         AssetsImages.instance.instagramImage,
          //         scale: 30.0,
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 18.0,
          ),
          SizedBox(
            height: 45,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Login"),
            ),
          ),
        ],
      ),
    )));
  }
}
