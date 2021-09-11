import 'package:flutter/material.dart';

class WorkoutItems with ChangeNotifier {
  String title;
  WorkoutItems({@required this.title});
}

class WorkoutItemsProvider with ChangeNotifier {
  List<WorkoutItems> _data = [
    WorkoutItems(title: 'Chest Press'),
    WorkoutItems(title: 'Chest Press Upper'),
    WorkoutItems(title: 'Chest Press Lower'),
    WorkoutItems(title: 'Chest Press Wide'),
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
