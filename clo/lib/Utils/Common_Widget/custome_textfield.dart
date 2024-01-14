import 'package:flutter/material.dart';

class CustomeTextField extends StatelessWidget {
  final titleLabel;
  final maxLength;
  final icon;
  final controller;
  final inputType;
 
  CustomeTextField(
      {super.key,
      @required this.titleLabel,
      @required this.maxLength,
      @required this.icon,
      @required this.controller, this.inputType,
      });
  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLength: maxLength,
      controller: controller,
      keyboardType: inputType,
      decoration: InputDecoration(
        labelText: titleLabel,
        suffixIcon: Icon(
          icon,
          color: Colors.black,
        ),
        
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }
}
