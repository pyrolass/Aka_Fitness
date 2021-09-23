import 'package:akafitness/models/workouts_items.dart';
import 'package:akafitness/widgets/searchfield.dart';
import 'package:akafitness/widgets/wourkouts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatelessWidget {
  static String routeName = '/workout-screen';

  @override
  Widget build(BuildContext context) {
    List<WorkoutItems> _data = Provider.of<WorkoutItemsProvider>(context).data;
    return Scaffold(
      appBar: AppBar(
        title: Text('workout'),
        backgroundColor: Color.fromRGBO(229, 49, 35, 1),
      ),
      body: ListView(
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
          GridView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 15,
                childAspectRatio: 2.5 / 3),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: _data[index],
                child: Workouts(),
              );
            },
            itemCount: _data.length,
          ),
        ],
      ),
    );
  }
}
