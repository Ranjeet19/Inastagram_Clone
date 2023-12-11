import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instagram_app/resourses/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> signUpUser({
    required String username,
    required String password,
    required String email,
    required String bio,
    required Uint8List file,
  }) async {
    String res = "Some Error Occoured";

    try {
      if (username.isNotEmpty ||
          password.isNotEmpty ||
          email.isNotEmpty ||
          bio.isNotEmpty ||
          file != null) {
        //Regestering The Users
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        print(cred.user!.uid);

        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePics', file, false);
        // Add users to databaseee
        _firestore.collection("users").doc(cred.user!.uid).set({
          'username': username,
          'password': password,
          'uid': cred.user!.uid,
          'email': email,
          'bio': bio,
          'followers': [],
          'following': [],
          'photoUrl': photoUrl,
        });

        res = "Success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

// Log In users
  Future<String> logInUsers({
    required String email,
    required String password,
  }) async {
    String res = " Some Error Occured";
    try {
      if (email.isNotEmpty || password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "Success";
      } else {
        res = " Please enter all The Field Properly";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }
}
