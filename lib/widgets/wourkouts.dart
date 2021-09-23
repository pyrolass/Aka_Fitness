import 'package:akafitness/models/workouts_items.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    WorkoutItems _data = Provider.of<WorkoutItems>(context);
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
            Icon(
              Icons.ac_unit,
            ),
            AutoSizeText(
              _data.title,
              maxLines: 1,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
      ),
    );
  }
}
