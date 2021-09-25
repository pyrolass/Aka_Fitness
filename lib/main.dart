import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './screens/auth_screen.dart';
import './screens/home_screen.dart';
import './screens/favorite_screen.dart';
import './screens/tab_screen.dart';
import './screens/workout_screen.dart';

import './models/body_items.dart';
import './models/workouts_items.dart';

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
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aka Fitness',
        theme: ThemeData(
          primaryColor: Color.fromRGBO(229, 49, 35, 1),
        ),
        home: AuthScreen(),
        routes: {
          AuthScreen.routeName: (context) => AuthScreen(),
          HomeScreen.routeName: (context) => HomeScreen(),
          TabScreen.routeName: (context) => TabScreen(),
          FavoriteScreen.routeName: (context) => FavoriteScreen(),
        },
      ),
    );
  }
}
