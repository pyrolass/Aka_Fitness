import 'package:flutter/material.dart';

import './workouts_items.dart';

class BodyItems with ChangeNotifier {
  String title;
  String image;

  BodyItems({
    @required this.title,
    @required this.image,
  });
}

class BodyItemsProvider with ChangeNotifier {
  List<BodyItems> _data = [
    BodyItems(
      title: 'Chest',
      image: 'assets/images/chest.jpg',
    ),
    BodyItems(
      title: 'Leg',
      image: 'assets/images/leg.jpg',
    ),
    BodyItems(
      title: 'Triceps',
      image: 'assets/images/triceps.jpg',
    ),
    BodyItems(
      title: 'Shoulders',
      image: 'assets/images/shoulder.jpg',
    ),
    BodyItems(
      title: 'Back',
      image: 'assets/images/back.jpg',
    ),
    BodyItems(
      title: 'Biceps',
      image: 'assets/images/biceps.jpg',
    ),
    BodyItems(
      title: 'Core',
      image: 'assets/images/core.jpg',
    ),
  ];

  List<BodyItems> get data {
    return [..._data];
  }
}
