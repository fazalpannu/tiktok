import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/view/screen/auth/login_screen.dart';
import 'package:tiktok/view/screen/homescreen.dart';

class SplashServices {
  void login(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Timer(Duration(seconds: 6), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ));
      });
    } else {
      Timer(Duration(seconds: 6), () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => loginscreen(),
            ));
      });
    }
  }
}
