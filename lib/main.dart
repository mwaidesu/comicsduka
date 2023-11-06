// ignore_for_file: prefer_const_constructors

import 'package:comicsduka/constants/theme.dart';
import 'package:comicsduka/firebase_helper/firebase_auth_helper/firebase_auth_helper.dart';
import 'package:comicsduka/firebase_helper/firebase_options/firebase_options.dart';
import 'package:comicsduka/screens/home/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:comicsduka/screens/auth_ui/welcome/welcome.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ComicsDuka',
        theme: themeData,
        home: StreamBuilder(
            stream: FirebaseAuthHelper.instance.getAuthChange,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Home();
              } else{
                return const Welcome();
              }
            }),
    );
  }
}
