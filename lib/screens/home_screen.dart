import 'package:akafitness/models/mongo_server.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import './auth_screen.dart';

import '../models/body_items.dart';
import '../widgets/profile_card.dart';
import '../widgets/body_parts.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    List<BodyItems> _data = Provider.of<BodyItemsProvider>(context).data;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Aka Fitness',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromRGBO(229, 49, 35, 1),
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacementNamed(context, AuthScreen.routeName);
          },
          icon: Icon(
            Icons.logout_outlined,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            color: Colors.black,
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ProfileCard(),
          SizedBox(
            height: 30,
          ),
          GridView.builder(
            padding: EdgeInsets.all(10),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 15,
            ),
            itemBuilder: (context, index) {
              return ChangeNotifierProvider.value(
                value: _data[index],
                child: BodyPartsWorkouts(),
              );
            },
            itemCount: _data.length,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          MongoServer data = MongoServer();
          data.getFavoriteItems(context);
        },
      ),
    );
  }
}
