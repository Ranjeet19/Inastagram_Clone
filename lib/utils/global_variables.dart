// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:instagram_app/screens/add_post_screen.dart';
import 'package:instagram_app/screens/feed_screen.dart';
import 'package:instagram_app/screens/profile_screen.dart';
import 'package:instagram_app/screens/search_screen.dart';

const webScreenSize = 600;

const homeScreenItems = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Text("Faviroute"),
ProfileScreen()];
