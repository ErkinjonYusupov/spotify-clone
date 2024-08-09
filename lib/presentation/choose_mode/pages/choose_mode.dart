import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/button/basic_app_button.dart';
import 'package:spotify/core/config/assets/app_images.dart';
import 'package:spotify/core/config/assets/app_vectors.dart';
import 'package:spotify/core/config/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/signup_or_signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

class ChooseMode extends StatefulWidget {
  const ChooseMode({super.key});

  @override
  State<ChooseMode> createState() => _ChooseModeState();
}

class _ChooseModeState extends State<ChooseMode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.15),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 40),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(AppImages.chooseMoedBG),
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.topCenter,
                    child: SvgPicture.asset(AppVectors.logo)),
                const Spacer(),
                const Text(
                  "Choose mode",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ChooseModeButton(
                      icon: AppVectors.moon,
                      text: "Dark Mode",
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.dark);
                      },
                    ),
                    const SizedBox(width: 50),
                    ChooseModeButton(
                      icon: AppVectors.sun,
                      text: "Light Mode",
                      onTap: () {
                        context.read<ThemeCubit>().updateTheme(ThemeMode.light);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 50),
                BasicAppButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const SignupOrSignin()));
                    },
                    title: "Continue")
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChooseModeButton extends StatelessWidget {
  const ChooseModeButton(
      {super.key, required this.icon, required this.text, required this.onTap});
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipOval(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xff30393c).withOpacity(.5),
                  shape: BoxShape.circle,
                ),
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.none,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 15),
        Text(
          text,
          style: const TextStyle(
              fontSize: 17, fontWeight: FontWeight.w500, color: AppColors.gray),
        )
      ],
    );
  }
}
