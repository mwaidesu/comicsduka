import 'package:comicsduka/constants/asset_images.dart';
import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/screens/auth_ui/login/login.dart';
import 'package:comicsduka/screens/auth_ui/sign_up/sign_up.dart';
import 'package:comicsduka/widgets/primary_button/primary_button.dart';
import 'package:comicsduka/widgets/top_titles/top_titles.dart';
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
          TopTitles(
              title: "ComicsDuka", subtitle: "Your One Stop Shop For Comics"),

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
            height: 30.0,
          ),
          PrimaryButton(
            title: "Login",
            onPressed: () {
              Routes.instance.push(widget: const Login(), context: context);
            },
          ),

          const SizedBox(
            height: 18.0,
          ),
          PrimaryButton(
            title: "Sign Up",
            onPressed: () {
              Routes.instance.push(widget: const SignUp(), context: context);
            },
          ),
        ],
      ),
    )));
  }
}
