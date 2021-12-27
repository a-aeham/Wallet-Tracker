import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'package:wallet/screens/signin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      navigateRoute: const SignInScreen() ,
      duration: 4000,
      imageSize: 260,
      imageSrc: "images/ntu_logo_bg.png",
      backgroundColor: const Color(0xFFE5E7E0),
    );
  }
}
