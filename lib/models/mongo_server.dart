import 'package:mongo_dart/mongo_dart.dart';
import 'package:provider/provider.dart';

import './workouts_items.dart';

class MongoServer {
  Future<List<WorkoutItems>> getAllItems(context, String bodyPart) async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection(bodyPart);
    var data =
        await coll.find().map((el) => WorkoutItems.fromJson(el)).toList();

    print(data);
    Provider.of<WorkoutItemsProvider>(context, listen: false).addData(data);
    return data;
  }

  toggleFavorite(context, String bodyPart, String workout) async {
    bool isFavorite =
        Provider.of<WorkoutItems>(context, listen: false).isFavorite;
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection(bodyPart);

    Provider.of<WorkoutItems>(context, listen: false).togglefavoriteStatus();

    coll.updateOne(
      where.eq('title', '$workout'),
      modify.set('isFavorite', isFavorite),
    );
  }

  addData() async {
    var db = await Db.create(
        "mongodb://Pyro:morningstar99@cluster0-shard-00-00.awbc5.mongodb.net:27017,cluster0-shard-00-01.awbc5.mongodb.net:27017,cluster0-shard-00-02.awbc5.mongodb.net:27017/aka?ssl=true&replicaSet=atlas-13da2a-shard-0&authSource=admin&retryWrites=true&w=majority");
    await db.open();
    var coll = db.collection('core');
    coll.insertMany([
      {"title": "abs leg raise", "isFavorite": false},
      {"title": "abs leg raise arched", "isFavorite": false},
      {"title": "abs pull up", "isFavorite": false},
    ]);
  }
}
