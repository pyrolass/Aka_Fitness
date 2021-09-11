import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BodyItems with ChangeNotifier {
  String title;
  BodyItems({@required this.title});
}

class BodyItemsProvider with ChangeNotifier {
  List<BodyItems> _data = [
    BodyItems(title: 'Chest'),
    BodyItems(title: 'Leg'),
    BodyItems(title: 'Triseps'),
    BodyItems(title: 'Back'),
    BodyItems(title: 'Biseps'),
    BodyItems(title: 'Neck'),
    BodyItems(title: 'Abs'),
  ];

  List<BodyItems> get data {
    return [..._data];
  }
}
