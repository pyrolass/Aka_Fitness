import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  static String routeName = '/favorite-screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(229, 49, 35, 1),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Text('123'),
        ),
      ),
    );
  }
}
