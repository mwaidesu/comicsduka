// ignore_for_file: unnecessary_const

import 'package:comicsduka/widgets/primary_button/primary_button.dart';
import 'package:comicsduka/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon(Icons.arrow_back),
            const TopTitles(
                title: "Login", subtitle: "Welcome Back To ComicsDuka"),
            const SizedBox(
              height: 45.0,
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: "Enter Your Email",
                prefixIcon: Icon(
                  Icons.email_outlined,
                ),
              ),
            ),

            const SizedBox(
              height: 12.0,
            ),
            TextFormField(
              obscureText: isShowPassword,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                prefixIcon: const Icon(
                  Icons.password_outlined,
                ),
                suffixIcon: CupertinoButton(
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                        // print(isShowPassword);
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.visibility,
                      color: Colors.grey,
                    )),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            PrimaryButton(
              title: "Login",
              onPressed: () {},
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Center(
              child: Text("Don't have an account yet?"),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
                child: CupertinoButton(
                    onPressed: () {},
                    child: Text(
                      "Create an Account",
                      style:TextStyle(
                        color: Theme.of(context).primaryColor
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
