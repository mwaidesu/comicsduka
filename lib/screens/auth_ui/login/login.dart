import 'package:comicsduka/constants/asset_images.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

    @override
  Widget build(BuildContext context) {
    return  SafeArea(child: Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Welcome", style:TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),),
          const SizedBox(
            // height: kToolbarHeight +12,
            height: 12,
          ),
          const Text("Get your favorite comics", style: TextStyle(
            fontSize: 18.0,
          ),),
          Center(child: Image.asset(AssetsImages.instance.welcomeImage,
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.facebook,
              size: 35,
              color: Colors.blue,
               ),
                         // Image.asset(
          //   AssetsImages.instance.googleImage,
          //   scale: 30.0,
          // ),
           Image.asset(
            AssetsImages.instance.instagramImage,
            scale: 30.0,
          ),
            ],
          ),


        ],

      ),
    )));
  
  }
}
