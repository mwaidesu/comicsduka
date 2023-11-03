// ignore_for_file: unnecessary_const

import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/screens/auth_ui/login/login.dart';
import 'package:comicsduka/widgets/primary_button/primary_button.dart';
import 'package:comicsduka/widgets/top_titles/top_titles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isShowPassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Icon(Icons.arrow_back),
              const TopTitles(
                  title: "Create Account", subtitle: "Welcome To ComicsDuka"),
              
              const SizedBox(
                height: 45.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Enter Your Name",
                  prefixIcon: Icon(Icons.person_2_outlined,
                  ),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
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
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: "Enter Your Phone Number",
                  prefixIcon: Icon(
                    Icons.phone_outlined,
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
                title: "Sign Up",
                onPressed: () {},
              ),
              const SizedBox(
                height: 12.0,
              ),
              const Center(
                child: Text("I have an account"),
              ),
              const SizedBox(
                height: 12.0,
              ),
              Center(
                  child: CupertinoButton(
                      onPressed: () {
                        Routes.instance.push(widget: Login(), context: context);
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(color: Theme.of(context).primaryColor),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
