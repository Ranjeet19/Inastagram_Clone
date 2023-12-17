import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:instagram_app/providers/user_provider.dart';
import 'package:provider/provider.dart';

import '../utils/dimensionn.dart';


class ResponsiveLayout extends StatefulWidget {

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({Key?key,required this.webScreenLayout, required this.mobileScreenLayout}):super(key:key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {

  void initState(){
    super.initState();
    addData();
  }
  

  addData()async{
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
     builder: (context, constraints){
      if(constraints.maxWidth> webScreenSize){
        // web Screen
        return widget.webScreenLayout;
      }
      // Mobile Screen
     return widget.mobileScreenLayout;
     },
    );
  }
}