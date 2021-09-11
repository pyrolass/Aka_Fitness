import 'package:akafitness/models/body_items.dart';
import 'package:akafitness/widgets/profile_card.dart';
import 'package:akafitness/widgets/body_parts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

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
          onPressed: () {},
          icon: Icon(
            Icons.logout_outlined,
            size: 30,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              size: 30,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: ListView(
          children: [
            ProfileCard(),
            SizedBox(
              height: 30,
            ),
            GridView.builder(
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
      ),
    );
  }
}
