import 'package:flutter/material.dart';
import 'package:instagram_app/responsive/mobile_screen_layout.dart';
import 'package:instagram_app/responsive/responsive_layout_screen.dart';
import 'package:instagram_app/responsive/web_screen_layout.dart';
import 'package:instagram_app/utils/colors.dart';


import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// ...

void main()  async {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp()); 

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    
);}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Instagram_App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor
      ),
      home: const ResponsiveLayout(mobileScreenLayout: MobileScreenLayout(), webScreenLayout:WebScreenLayout() ,),
    );
  }
}
