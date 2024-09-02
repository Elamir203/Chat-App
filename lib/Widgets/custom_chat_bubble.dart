import 'package:chat_app/Models/message_model.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class MyChatBubble extends StatelessWidget {
  const MyChatBubble({required this.message , super.key});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(30),
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
        padding: EdgeInsets.only(left: 16 , right: 16 , top: 25 , bottom: 25),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class OthersChatBubble extends StatelessWidget {
  const OthersChatBubble({required this.message , super.key});

  final MessageModel message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        decoration: BoxDecoration(
            color: kSecondaryColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              topRight: Radius.circular(30),
              topLeft: Radius.circular(30),
            )),
        margin: EdgeInsets.symmetric(horizontal: 16 , vertical: 6),
        padding: EdgeInsets.only(left: 16 , right: 16 , top: 25 , bottom: 25),
        child: Text(
          message.text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

