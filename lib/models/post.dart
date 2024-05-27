import 'package:cloud_firestore/cloud_firestore.dart';

class Post {
  final String description;
  final String uid;
  final String postUrl;
  final  datePublished;
  final String profImage;
  final String username;
  final String postId;
  final Likes;

  Post({
    required this.description,
    required this.uid,
    required this.postId,
    required this.postUrl,
    required this.username,
    required this.profImage,
    required this.datePublished,
    required this.Likes,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "description": description,
        "postId": postId,
        "datePublished": datePublished,
        "Likes": Likes,
        "postUrl": postUrl,
        "profImage": profImage,
      };

  static Post fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Post(
      username: snapshot['username'],
      uid: snapshot['uid'],
      description: snapshot['description'],
      postUrl: snapshot['postUrl'],
      postId: snapshot['postId'],
      datePublished: snap['datePublished'],
      profImage: snap['profImage'],
      Likes: snap['Likes'],
    );
  }
}
