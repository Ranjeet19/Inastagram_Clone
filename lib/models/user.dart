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
}