import 'package:flutter/material.dart';

class WorkoutItems with ChangeNotifier {
  String title;
  WorkoutItems({@required this.title});

  factory WorkoutItems.fromJson(Map<String, dynamic> json) =>
      WorkoutItems(title: json["title"]);
}

class WorkoutItemsProvider with ChangeNotifier {
  List<WorkoutItems> _data = [WorkoutItems(title: 'test')];

  List<WorkoutItems> _filteredData = [];

  List<WorkoutItems> get data {
    return _filteredData.isEmpty ? [..._data] : [..._filteredData];
  }

  void addData(List<WorkoutItems> data) {
    List<WorkoutItems> newData = data;
    _data = newData;
    print(_data[0].title);
    notifyListeners();
  }

  void searchItem(String title) {
    _filteredData = _data
        .where((element) =>
            element.title.toLowerCase().contains(title.toLowerCase()))
        .toList();

    notifyListeners();
  }
}
