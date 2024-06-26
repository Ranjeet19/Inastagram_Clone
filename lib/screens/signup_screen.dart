import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram_app/responsive/mobile_screen_layout.dart';
import 'package:instagram_app/responsive/responsive_layout_screen.dart';
import 'package:instagram_app/responsive/web_screen_layout.dart';
import 'package:instagram_app/utils/colors.dart';
import 'package:instagram_app/utils/utils.dart';

import '../resourses/auth_methods.dart';
import '../widgets/text_field_input.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordCotroler = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  Uint8List? _image;
  bool _isLoading = false;

  // const LoginScreen({super.key});

  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordCotroler.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signUpUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      username: _usernameController.text,
      password: _passwordCotroler.text,
      email: _emailController.text,
      bio: _bioController.text,
      file: _image!,
    );

    setState(() {
      _isLoading = true;
    });

    if (res != 'success') {
      showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) =>  ResponsiveLayout(
              webScreenLayout: WebScreenLayout(),
              mobileScreenLayout: MobileScreenLayout())));
    }
  }

  void navigateToLogin() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        width: double.infinity,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          // SVG instagram LOGO
          SvgPicture.asset(
            'assets/ic_instagram.svg',
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            height: 40,
          ),
          const SizedBox(
            height: 30,
          ),

          // Circular avatar widget for selecting dp images,

          Stack(
            children: [
              _image != null
                  ? CircleAvatar(
                      radius: 50,
                      backgroundImage: MemoryImage(_image!),
                    )
                  : const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrxMNkq9COMgaR8ikKTfjVHoAHcOdydsBHoQ&usqp=CAU"),
                    ),
              Positioned(
                bottom: -10,
                left: 70,
                child: IconButton(
                    onPressed: selectImage,
                    icon: const Icon(CupertinoIcons.add_circled_solid)),
              ),
            ],
          ),
          SizedBox(
            height: 24,
          ),
          //Text field Input for Username,
          TextFieldInput(
            hintText: " Enter Username",
            textInputType: TextInputType.text,
            textEditingController: _usernameController,
          ),
          SizedBox(
            height: 24,
          ),

          //Text fiel input for password,
          TextFieldInput(
            hintText: "Enter Password",
            textEditingController: _passwordCotroler,
            textInputType: TextInputType.text,
            isPass: true,
          ),

          const SizedBox(
            height: 24,
          ),
          //Text field Input for Email,
          TextFieldInput(
            hintText: " Enter Email Address",
            textInputType: TextInputType.emailAddress,
            textEditingController: _emailController,
          ),
          SizedBox(
            height: 24,
          ),
          //Text field Input for Bio,
          TextFieldInput(
            hintText: " Enter a short brief Bio here",
            textInputType: TextInputType.text,
            textEditingController: _bioController,
          ),
          SizedBox(
            height: 24,
          ),
          //Loginn Button,

          InkWell(
            onTap: signUpUser,
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12),
              decoration: const ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(4),
                    ),
                  ),
                  color: blueColor),
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: primaryColor,
                      ),
                    )
                  : const Text('Sign Up'),
            ),
          ),

          const SizedBox(
            height: 12,
          ),
          Flexible(
            child: Container(),
            flex: 2,
          ),

          // Transition Button,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: const Text(
                  "Already have an Account? ",
                ),
              ),
              GestureDetector(
                onTap: navigateToLogin,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: const Text("Sign In",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          )
        ]),
      )),
    );
  }
}
