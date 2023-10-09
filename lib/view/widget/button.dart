import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:tiktok/constants.dart';

class MyButton extends StatelessWidget {
  String textstring;
  Callback ontap;
  MyButton({super.key, required this.textstring, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: InkWell(
        onTap: ontap,
        child: Center(
          child: Text(
            textstring,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
