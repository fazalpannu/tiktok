import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/controller/splash_service.dart';
import 'package:tiktok/view/screen/add_video.dart';

Color backgroundColor = Colors.black;
Color? buttonColor = Colors.red[400];
Color borderColor = Colors.grey;

// FIREBASE
var firebaseAuth = FirebaseAuth.instance;
var firebaseStorage = FirebaseStorage.instance;
var firestore = FirebaseFirestore.instance;

// CONTROLLER
AuthController authController = Get.put(AuthController());

List pages = [
  Text('Video Screen'),
  // VideoScreen(),
  Text('Search Screen'),
  // SearchScreen(),
  const AddVideoScreen(),
  Text('Messages Screen'),
  Text('Profile Screen'),
  // ProfileScreen(uid: authController.user.uid),
];
