import 'package:flutter/material.dart';

class BodyItems with ChangeNotifier {
  String title;
  BodyItems({@required this.title});
}

class BodyItemsProvider with ChangeNotifier {
  List<BodyItems> _data = [
    BodyItems(title: 'Chest'),
    BodyItems(title: 'Leg'),
    BodyItems(title: 'Triceps'),
    BodyItems(title: 'Back'),
    BodyItems(title: 'Biceps'),
    BodyItems(title: 'Neck'),
    BodyItems(title: 'Core'),
  ];

  List<BodyItems> get data {
    return [..._data];
  }
}
