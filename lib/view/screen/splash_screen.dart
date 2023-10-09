import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:flutter/material.dart';

import 'dart:io';

import 'package:tiktok/controller/splash_service.dart';

class spalashscreen extends StatefulWidget {
  const spalashscreen({super.key});

  @override
  State<spalashscreen> createState() => _loginscreenState();
}

class _loginscreenState extends State<spalashscreen> {
  SplashServices _splashServices = SplashServices();

  @override
  void initState() {
    // TODO: implement initState

    _splashServices.login(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Splash',
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 250.0,
            child: TextLiquidFill(
              text: 'Firebase-Toturials',
              waveColor: Colors.white,
              boxBackgroundColor: Colors.black,
              textStyle: TextStyle(
                fontSize: 30.0,
                fontFamily: 'DancingScript',
                fontWeight: FontWeight.bold,
              ),
              boxHeight: 300.0,
            ),
          ),
        ),
      ),
    );
  }
}
