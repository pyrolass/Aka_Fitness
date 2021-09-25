import 'package:akafitness/models/mongo_server.dart';
import 'package:akafitness/models/workouts_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';

class Workouts extends StatelessWidget {
  final MongoServer test = MongoServer();
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
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _data.title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            IconButton(
              onPressed: () {
                test.toggleFavorite(context, 'chest', _data.title);
              },
              icon: Icon(
                _data.isFavorite ? Icons.favorite : Icons.favorite_outline,
              ),
              iconSize: MediaQuery.of(context).size.height / 30,
            ),
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
