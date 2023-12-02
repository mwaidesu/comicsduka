

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comicsduka/constants/constants.dart';
import 'package:comicsduka/constants/routes.dart';
import 'package:comicsduka/models/user_model/user_model.dart';
import 'package:comicsduka/screens/auth_ui/welcome/welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirebaseAuthHelper {
  static FirebaseAuthHelper instance = FirebaseAuthHelper();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;
  Stream<User?> get getAuthChange => _auth.authStateChanges();

  Future<bool> login(
      String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pop();
      // Routes.instance.pushAndRemoveUntil(widget: const Home(), context: context);

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

  Future<bool> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      UserModel userModel = UserModel(
          id: userCredential.user!.uid, name: name, email: email, image: null);

      _firestore.collection("users").doc(userModel.id).set(userModel.toJson());
      Navigator.of(context, rootNavigator: true).pop();
      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }

  void signOut(BuildContext context) async {
    await _auth.signOut();

    FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User signed out');

        // Navigate back to the welcome screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      } else {
        print('User signed in: ${user.uid}');
      }
    });
  }

  

  Future<bool> changePassword(String password, BuildContext context) async {
    try {
      showLoaderDialog(context);
      _auth.currentUser!.updatePassword(password);
      Navigator.of(context, rootNavigator: true).pop();
      showMessage("Password Changed");
      Navigator.of(context).pop();

      return true;
    } on FirebaseAuthException catch (error) {
      Navigator.of(context, rootNavigator: true).pop();
      showMessage(error.code.toString());
      return false;
    }
  }
}
