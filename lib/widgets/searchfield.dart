import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final Widget textField;
  SearchField(this.textField);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: textField,
    );
  }
}
