import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  CustomFormTextField({this.onChanged , required this.hintText , this.obscureText = false});

  final String? hintText;
  Function(String)? onChanged;
  bool obscureText;
  //RegExp regex1 = RegExp(r'^(?=.*?[a-z]).{8,}$');
  //RegExp regex2 = RegExp(r'^(?=.*?[0-9]).{8,}$');

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: (data)
      {
        if(data!.isEmpty){
          return 'this field is required';
        }
        else if(data.length < 8){
          return 'this field must be at least 8 characters';
        }
        // else if(!regex1.hasMatch(data)){
        //   return 'this field must contain at least one lower case character';
        // }
        // else if(!regex2.hasMatch(data)){
        //   return 'this field must contain at least one digit';
        // }
        return null;
      },
      onChanged: onChanged,
      style: const TextStyle(
        color: Colors.white, // Change text color here
        fontSize: 18,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.purpleAccent,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
      ),
      cursorColor: Colors.white,
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
    );
  }
}
