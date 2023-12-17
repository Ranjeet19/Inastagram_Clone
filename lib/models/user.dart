import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final String username;
  final List followers;
  final List following;

  User({
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.username,
    required this.followers,
    required this.following
  });

  Map<String, dynamic> toJson()=>{
    "username": username,
    "uid": uid,
    "email":email,
    "photoUrl":photoUrl,
    "bio": bio,
    "followers": followers,
    "following":following,
  };

  static User fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      email: snapshot['email'], 
      uid: snapshot['uid'], 
      photoUrl: snapshot['photoUrl'], 
      bio: snapshot['bio'], 
      username: snapshot['username'], 
      followers: snap['followers'], 
      following: snap['following'],
      );
  }
}