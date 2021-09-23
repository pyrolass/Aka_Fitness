import 'package:flutter/material.dart';

class WorkoutItems with ChangeNotifier {
  String title;
  WorkoutItems(this.title);
}

class WorkoutItemsProvider with ChangeNotifier {
  List<WorkoutItems> _data = [
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
  ];

  List<WorkoutItems> _filteredData = [];

  List<WorkoutItems> get data {
    return _filteredData.isEmpty ? [..._data] : [..._filteredData];
  }

  void searchItem(String title) {
    _filteredData = _data
        .where((element) =>
            element.title.toLowerCase().contains(title.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
