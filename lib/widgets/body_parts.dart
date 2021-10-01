import 'package:akafitness/models/body_items.dart';
import 'package:akafitness/models/mongo_server.dart';
import 'package:akafitness/models/workouts_items.dart';
import 'package:akafitness/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';

class BodyPartsWorkouts extends StatefulWidget {
  @override
  State<BodyPartsWorkouts> createState() => _BodyPartsWorkoutsState();
}

class _BodyPartsWorkoutsState extends State<BodyPartsWorkouts> {
  MongoServer test = MongoServer();

  @override
  Widget build(BuildContext context) {
    BodyItems _data = Provider.of<BodyItems>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3,
              spreadRadius: 3,
              offset: Offset(3, 3),
            )
          ],
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Image.asset(
                _data.image,
              ),
            ),
            Text(
              _data.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WorkoutScreen(
              title: _data.title,
            ),
          ),
        );
      },
    );
  }
}
