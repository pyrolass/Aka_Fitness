import 'package:akafitness/models/mongo_server.dart';
import 'package:akafitness/models/workouts_items.dart';
import 'package:akafitness/widgets/searchfield.dart';
import 'package:akafitness/widgets/wourkouts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatefulWidget {
  static String routeName = '/workout-screen';
  final String title;
  WorkoutScreen({@required this.title});
  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  Future<List<WorkoutItems>> getData;
  @override
  void initState() {
    setState(() {
      getData = MongoServer().getAllItems(context, widget.title.toLowerCase());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<WorkoutItems> _data = Provider.of<WorkoutItemsProvider>(context).data;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Provider.of<WorkoutItemsProvider>(context, listen: false)
                .resetData();
            Navigator.pop(context);
          },
        ),
        title: Text(widget.title),
        backgroundColor: Color.fromRGBO(229, 49, 35, 1),
      ),
      body: FutureBuilder(
        future: getData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                SearchField(
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_rounded),
                      border: InputBorder.none,
                    ),
                    onChanged: (value) => {
                      Provider.of<WorkoutItemsProvider>(context, listen: false)
                          .searchItem(value)
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ChangeNotifierProvider.value(
                      value: _data[index],
                      child: Workouts(widget.title),
                    );
                  },
                  itemCount: _data.length,
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
