import 'package:flutter/material.dart';

import './workouts_items.dart';

class BodyItems with ChangeNotifier {
  String title;
  String image;
  List<WorkoutItems> workoutItems;
  BodyItems({
    @required this.title,
    @required this.workoutItems,
    @required this.image,
  });
}

class BodyItemsProvider with ChangeNotifier {
  List<BodyItems> _data = [
    BodyItems(
      title: 'Chest',
      image: 'assets/images/chest.jpg',
      workoutItems: [
        WorkoutItems('Barbell Bench Press'),
        WorkoutItems('Dumbbell Bench Press'),
        WorkoutItems('Incline Bench Press'),
        WorkoutItems('Decline Press'),
        WorkoutItems('Machine Chest Press'),
        WorkoutItems('Push-Up'),
        WorkoutItems('Dip'),
        WorkoutItems('Chest Fly'),
        WorkoutItems('Dumbbell Pull-Over'),
        WorkoutItems('Machine Fly'),
      ],
    ),
    BodyItems(
      title: 'Leg',
      image: 'assets/images/leg.jpg',
      workoutItems: [
        WorkoutItems('Leg Press'),
        WorkoutItems('Leg Curl'),
        WorkoutItems('Back Squat'),
        WorkoutItems('Front Squat'),
        WorkoutItems('Romanian Deadlift'),
        WorkoutItems('Good Mornings'),
        WorkoutItems('Walking Lunges'),
        WorkoutItems('Reverse Lunge'),
        WorkoutItems('Lateral Lunge'),
        WorkoutItems('Stepup'),
        WorkoutItems('Glute Bridge'),
        WorkoutItems('Hip Thrust'),
        WorkoutItems('Goblet Squat'),
        WorkoutItems('Bulgarian Split Squat'),
        WorkoutItems('Single-Leg Deadlift'),
      ],
    ),
    BodyItems(
      title: 'Triceps',
      image: 'assets/images/triceps.jpg',
      workoutItems: [
        WorkoutItems('Close-Grip Bench Press'),
        WorkoutItems('Decline Triceps Extension'),
        WorkoutItems('Band Pushdown'),
        WorkoutItems('Close-Grip Floor Press'),
        WorkoutItems('Lying Triceps Extension'),
        WorkoutItems('Pullover'),
        WorkoutItems('Lying Dumbbell Triceps Extension'),
        WorkoutItems('Tate Press'),
        WorkoutItems('Underhand Kickback'),
        WorkoutItems('One-Arm Overhead Extension'),
        WorkoutItems('Dip'),
        WorkoutItems('Band Triceps Extension'),
        WorkoutItems('Close-Grip Pushup'),
        WorkoutItems('Diamond Pushup'),
        WorkoutItems('Suspension Trainer Triceps Extension'),
      ],
    ),
    BodyItems(
      title: 'Shoulders',
      image: 'assets/images/shoulder.jpg',
      workoutItems: [
        WorkoutItems('Dumbbell Front Raise'),
        WorkoutItems('Dumbbell Lateral Raise'),
        WorkoutItems('Reverse Fly'),
        WorkoutItems('Seated Military Press'),
        WorkoutItems('Shoulder Press'),
        WorkoutItems('Standing Dumbbell Shoulder Press'),
        WorkoutItems('Plank Dumbbell Shoulder Raise'),
        WorkoutItems('Barbell Overhead Press'),
        WorkoutItems('High Pull'),
        WorkoutItems('Shoulder Shrug'),
        WorkoutItems('Farmer\'s Walk'),
      ],
    ),
    BodyItems(
      title: 'Back',
      image: 'assets/images/back.jpg',
      workoutItems: [
        WorkoutItems('Deadlift'),
        WorkoutItems('Bent-Over Row'),
        WorkoutItems('Pull-Up'),
        WorkoutItems('T-Bar Row'),
        WorkoutItems('Seated Row'),
        WorkoutItems('Single-Arm Smith Machine Row'),
        WorkoutItems('Lat Pull-Down'),
        WorkoutItems('Single-Arm Dumbbell Row'),
        WorkoutItems('Dumbbell Pull-Over'),
        WorkoutItems('Chest-Supported Row'),
      ],
    ),
    BodyItems(
      title: 'Biceps',
      image: 'assets/images/biceps.jpg',
      workoutItems: [
        WorkoutItems('Alternating Incline Dumbbell Curl'),
        WorkoutItems('Seated Alternating Hammer Curl'),
        WorkoutItems('Standing Reverse Barbell Curl'),
        WorkoutItems('Seated Alternating Dumbbell Curl'),
        WorkoutItems('Standing Cable Curl'),
        WorkoutItems('Standing Barbell Curl'),
        WorkoutItems('Zottman Curl'),
        WorkoutItems('Decline Dumbbell Curl'),
        WorkoutItems('Concentration Curl'),
        WorkoutItems('Cable Flex Curl'),
        WorkoutItems('Preacher Curl'),
        WorkoutItems('Seated Cable Row'),
        WorkoutItems('Bent Over Row'),
      ],
    ),
    BodyItems(
      title: 'Core',
      image: 'assets/images/core.jpg',
      workoutItems: [
        WorkoutItems('Hollowman'),
        WorkoutItems('High Plank'),
        WorkoutItems('Bridge'),
        WorkoutItems('Superman Pull'),
        WorkoutItems('V-Ups'),
        WorkoutItems('V-Sit'),
        WorkoutItems('Plank Knee Crosses'),
        WorkoutItems('Leg Raises'),
        WorkoutItems('Elbow Plank Twists'),
        WorkoutItems('Plank Shoulder Taps'),
      ],
    ),
  ];

  List<BodyItems> get data {
    return [..._data];
  }
}
