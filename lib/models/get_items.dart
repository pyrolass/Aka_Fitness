import 'dart:convert';

import 'package:akafitness/models/workouts_items.dart';
import 'package:mongo_dart/mongo_dart.dart';

class GetItems {
  getAllItems(String bodyPart) async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection(bodyPart);
    var data =
        await coll.find().map((el) => WorkoutItems.fromJson(el)).toList();

    print(data);
    WorkoutItemsProvider().addData(data);
  }
}
