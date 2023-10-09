import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:tiktok/constants.dart';

import 'package:tiktok/view/screen/auth/login_screen.dart';
import 'package:tiktok/view/widget/button.dart';
import 'package:tiktok/view/widget/text_input_field.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Tiktok Clone',
                style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  Obx(
                    () => Container(
                        child: authController.imagepath.isNotEmpty
                            ? CircleAvatar(
                                radius: 64,
                                backgroundImage: FileImage(File(authController
                                    .imagepath
                                    .toString())) // Use FileImage for local file
                                // ignore: prefer_const_constructors

                                // Use NetworkImage as a fallback if imagepath is empty
                                )
                            : CircleAvatar(
                                radius: 64,
                                backgroundImage: NetworkImage(
                                    'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'), // Use FileImage for local file
                                // ignore: prefer_const_constructors

                                // Use NetworkImage as a fallback if imagepath is empty
                              )),
                  ),
                  Positioned(
                    bottom: -7,
                    left: 90,
                    child: IconButton(
                      onPressed: () {
                        print('pick image');
                        authController.pickImage();
                      },
                      icon: const Icon(
                        Icons.add_a_photo,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextInputField(
                          controller: _usernameController,
                          labelText: 'Username',
                          icon: Icons.person,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextInputField(
                          controller: _emailController,
                          labelText: 'Email',
                          icon: Icons.email,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        child: TextInputField(
                          controller: _passwordController,
                          labelText: 'Password',
                          icon: Icons.lock,
                          isObscure: true,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 30,
              ),
              MyButton(
                  textstring: 'register',
                  ontap: () {
                    if (_formkey.currentState!.validate()) {
                      authController.registerUser(
                        _usernameController.text,
                        _emailController.text,
                        _passwordController.text,
                        authController.profilePhoto,
                      );
                    }
                  }),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already have an account? ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => loginscreen(),
                      ));
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(fontSize: 20, color: buttonColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
