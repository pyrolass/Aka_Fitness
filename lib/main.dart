import 'package:akafitness/models/body_items.dart';
import 'package:akafitness/models/workouts_items.dart';
import 'package:akafitness/screens/favorite_screen.dart';
import 'package:akafitness/screens/tab_screen.dart';
import 'package:akafitness/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (cntx) => BodyItemsProvider(),
        ),
        ChangeNotifierProvider(
          create: (cntx) => WorkoutItemsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aka Fitness',
        theme: ThemeData(
          canvasColor: Colors.black,
        ),
        home: AuthScreen(),
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          TabScreen.routeName: (context) => TabScreen(),
          FavoriteScreen.routeName: (context) => FavoriteScreen(),
          WorkoutScreen.routeName: (context) => WorkoutScreen(),
        },
      ),
    );
  }
}
