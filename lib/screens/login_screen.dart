import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_app/utils/colors.dart';

import '../widgets/text_field_input.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordCotroler = TextEditingController();

  // const LoginScreen({super.key});
  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    _passwordCotroler.dispose();
  }

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
            height: 64,
          ),
          const SizedBox(
            height: 64,
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


          //Loginn Button,

          Container(
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
            child: const  Text('Log In'),

          ),

        const SizedBox(height: 12,),
        Flexible(child: Container(), flex: 2,),

          // Transition Button,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding:  const EdgeInsets.symmetric(vertical: 8),
              child: const Text("Don't have an Account? ",),
            ),
            GestureDetector(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: const Text("Sign Up", style:TextStyle(fontWeight: FontWeight.bold)),
              ),
            )
          ],
        )  

        ]),
      )),
    );
  }
}
