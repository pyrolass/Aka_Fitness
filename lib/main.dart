import 'package:flutter/material.dart';

import './screens/auth_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aka Fitness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthScreen(),
      routes: {
        AuthScreen.routeName: (context) => AuthScreen(),
        HomeScreen.routeName: (context) => HomeScreen(),
      },
    );
  }
}
