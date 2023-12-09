import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthMethods{

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _firestore = FirebaseFirestore.instance;

   Future<String>signUpUser({
    required String username,
    required String password,
    required String email,
    required String bio,
    // required Uint8List file,
   })async{
      String res = "Some Error Occoured";

      try{
// ||file!=null
        if(username.isNotEmpty||password.isNotEmpty||email.isNotEmpty||bio.isNotEmpty ){

          //Regestering The Users
           UserCredential cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);

           print(cred.user!.uid);
        // Add users to databaseee
        _firestore.collection("users").doc(cred.user!.uid).set({
        'username' : username,
        'password': password,
        'uid':cred.user!.uid,
        'email':email,
        'bio':bio,
        'followers':[],
        'following':[],
         } );

         res = "Success";
        
        }
      }catch(err){
        res = err.toString();
      }
      return res;
   }
}