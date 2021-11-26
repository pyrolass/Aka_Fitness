import 'package:flutter/material.dart';

class WorkoutItems with ChangeNotifier {
  String title;
  bool isFavorite;
  WorkoutItems({required this.title, this.isFavorite = false});

  factory WorkoutItems.fromJson(Map<String, dynamic> json) => WorkoutItems(
        title: json["title"],
        isFavorite: json["isFavorite"],
      );

  void togglefavoriteStatus() {
    isFavorite = !isFavorite;
    //we use notify to rebuild the widget
    notifyListeners();
  }
}

class WorkoutItemsProvider with ChangeNotifier {
  List<WorkoutItems> _data = [];

  List<WorkoutItems> _filteredData = [];

  List<WorkoutItems> get data {
    return _filteredData.isEmpty ? [..._data] : [..._filteredData];
  }

  List<WorkoutItems> get onlyFavorites {
    return _data
        .where(
          (element) => element.isFavorite == true,
        )
        .toList();
  }

  void addData(List<WorkoutItems> data) {
    List<WorkoutItems> newData = data;
    _data = newData;
    notifyListeners();
  }

  void resetData() {
    _data = [];
    _filteredData = [];
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
