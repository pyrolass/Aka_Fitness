import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

import './workouts_items.dart';

class MongoServer {
  Future<List<WorkoutItems>> getAllItems(context, String bodyPart) async {
    // try {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    //   var coll = db.collection(bodyPart);
    //   var data =
    //       await coll.find().map((el) => WorkoutItems.fromJson(el)).toList();

    //   Provider.of<WorkoutItemsProvider>(context, listen: false).addData(data);
    //   print(data);
    //   return data;
    // } catch (err) {
    //   print(err);
    // }
    try {
      var coll = db.collection('workouts');
      var data = await coll
          .find({"workout": bodyPart.toLowerCase()})
          .map((el) => el['data'])
          .toList();
      List<WorkoutItems> workouts = [];
      data.forEach(
        (element) {
          for (int i = 0; i < element.length; i++) {
            workouts.add(WorkoutItems.fromJson(element[i]));
          }
        },
      );
      Provider.of<WorkoutItemsProvider>(context, listen: false)
          .addData(workouts);
      return workouts;
    } catch (err) {
      print(err);
    }
  }

  Future<List<WorkoutItems>> getFavoriteItems(context) async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    try {
      var coll = db.collection('workouts');
      var data = await coll
          .find({"data.isFavorite": true})
          .map((el) => el['data'])
          .toList();

      List<WorkoutItems> workouts = [];
      data.forEach(
        (element) {
          for (int i = 0; i < element.length; i++) {
            workouts.add(
              WorkoutItems.fromJson(element[i]),
            );
          }
        },
      );
      Provider.of<WorkoutItemsProvider>(context, listen: false).addData(
          workouts.where((element) => element.isFavorite == true).toList());

      return workouts;
    } catch (err) {
      print(err);
    }
  }

  toggleFavorite(context, String bodyPart, String workout) async {
    Provider.of<WorkoutItems>(context, listen: false).togglefavoriteStatus();
    bool isFavorite =
        Provider.of<WorkoutItems>(context, listen: false).isFavorite;

    try {
      var db = await Db.create(
          "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
      await db.open();
      var coll = db.collection('workouts');
      // coll.updateOne(
      //   where.eq('title', 'chest'),
      //   modify.set('isFavorite', true),
      // );
      await coll.updateOne(
        {
          "workout": bodyPart.toLowerCase(),
          "data.title": workout.toLowerCase()
        },
        {
          "\$set": {"data.\$.isFavorite": isFavorite}
        },
      );
    } catch (err) {
      print(err);
    }
  }

  addData() async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection('workouts');
    coll.insertMany([
      {
        "workout": "chest",
        "data": [
          {
            "title": "chest press upper",
            "isFavorite": false,
          },
          {
            "title": "chest press lower",
            "isFavorite": false,
          }
        ]
      },
      {
        "workout": "leg",
        "data": [
          {
            "title": "leg press upper",
            "isFavorite": false,
          },
          {
            "title": "leg press lower",
            "isFavorite": false,
          }
        ]
      },
      {
        "workout": "triceps",
        "data": [
          {
            "title": "triceps push down",
            "isFavorite": false,
          },
          {
            "title": "triceps push up",
            "isFavorite": false,
          }
        ]
      }
    ]);
  }

  get testData async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection('test');
    var data = await coll.find().map((el) => el['data']).toList();
    var workouts = [];
    data.forEach(
      (element) {
        for (int i = 0; i < element.length; i++) {
          workouts.add(element[i]);
          print(element[i]);
        }
      },
    );
  }
}
