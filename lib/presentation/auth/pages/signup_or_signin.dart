import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';

class SignupOrSignin extends StatefulWidget {
  const SignupOrSignin({super.key});

  @override
  State<SignupOrSignin> createState() => _SignupOrSigninState();
}

class _SignupOrSigninState extends State<SignupOrSignin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(AppVectors.topPattern),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SvgPicture.asset(AppVectors.bottomPattern),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SvgPicture.asset(AppImages.authBG),
          )
        ],
      ),
    );
  }
}
