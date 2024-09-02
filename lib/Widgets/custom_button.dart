import 'package:chat_app/constants.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({this.onTap , required this.buttonText});

  String buttonText;
  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 45,
        width: double.infinity,
        child: Center(
          child: Text(buttonText,style: const TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
          ),),
        ),
      ),
    );
  }
}
