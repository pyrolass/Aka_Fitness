import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final IconData prefixIcon;
  final String labelText;
  final Function(String value) onChanged;
  final Function(String value) onSubmitted;
  final TextEditingController controller;

  CustomTextField({
    @required this.labelText,
    @required this.prefixIcon,
    this.onChanged,
    this.onSubmitted,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 6.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 7.0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          labelText: '$labelText',
          contentPadding: EdgeInsets.all(screenHeight / 60),
          labelStyle: TextStyle(
            color: Colors.black.withOpacity(0.50),
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: Colors.black.withOpacity(0.70),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
