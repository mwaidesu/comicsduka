// ignore_for_file: unnecessary_const, use_build_context_synchronously, prefer_const_constructors

import 'package:comicsduka/constants/constants.dart';
import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:comicsduka/screens/auth_ui/sign_up/sign_up.dart';
import 'package:comicsduka/screens/custom_bottom_bar/custom_bottom_bar.dart';
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
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
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
                controller: email,
                decoration: const InputDecoration(
                  hintText: "test@gmail.com",
                  prefixIcon: Icon(
                    Icons.email_outlined,
                  ),
                ),
              ),
      
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                controller: password,
                obscureText: isShowPassword,
                decoration: InputDecoration(
                  hintText: "testpassword",
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
                height: 36.0,
              ),
              PrimaryButton(
                title: "Login",
                onPressed: () async {
                  bool isValidated = loginVaildation(email.text, password.text);
                  // print(email);
      
                  if (isValidated) {
                    bool isLoggedIn = await FirebaseAuthHelper.instance
                        .login(email.text, password.text, context);
      
                    if (isLoggedIn) {
                      Routes.instance
                          .pushAndRemoveUntil(widget: const CustomBottomBar(), context: context);
                    }
                  }            
                },
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
                      onPressed: () {
                        Routes.instance.push(widget:SignUp(), context: context);
                      },
                      child: Text(
                        "Create an Account",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
