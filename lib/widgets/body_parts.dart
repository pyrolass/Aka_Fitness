import 'package:akafitness/models/body_items.dart';
import 'package:akafitness/screens/workout_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'package:provider/provider.dart';

class BodyPartsWorkouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BodyItems _data = Provider.of<BodyItems>(context);
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.only(bottom: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.ac_unit,
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
        Navigator.pushNamed(context, WorkoutScreen.routeName);
      },
    );
  }
}
