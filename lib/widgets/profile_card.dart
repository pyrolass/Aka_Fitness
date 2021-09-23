import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 25,
        right: 10,
        left: 10,
      ),
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.25,
      decoration: BoxDecoration(
        color: Color.fromRGBO(229, 49, 35, 1),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5,
            spreadRadius: 5,
            offset: Offset(5, 5),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.bubble_chart,
            size: 40,
            color: Colors.white,
          ),
          Text(
            'Hi Hamno',
            style: TextStyle(
              fontSize: 26,
              color: Colors.white,
            ),
          ),
          Text(
            'Welcome Back',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 26,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
