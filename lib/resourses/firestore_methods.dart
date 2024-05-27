
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_app/models/post.dart';
import 'package:instagram_app/resourses/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FirestoreMethods{
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // upload Post
  Future<String> uploadPost(
    String description,
    String uid,
    Uint8List file,
    String username,
    String profImage,
  )async{
    String res = " Some Error Occured";
    try{
      String photoUrl = await StorageMethods().uploadImageToStorage('posts', file, true);


      String postId = const Uuid().v1();
      Post post = Post(
        description: description,
        username: username,
        uid: uid,
        postId:postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profImage: profImage,
        Likes: [],
      );

      _firestore.collection('posts').doc(postId).set(post.toJson());
      res = "Success";
    }catch(err){
      res = err.toString();
    }
    return res;
  }
}