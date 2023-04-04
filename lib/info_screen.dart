import 'package:flutter/material.dart';
import 'package:garden_planner/constants.dart';
import 'package:garden_planner/home.dart';
import 'plant_description_list.dart';

class DescriptionScreen extends StatelessWidget {
  DescriptionScreen({this.plantInfo});
  final plantInfo;

  @override
  Widget build(BuildContext context) {
    const int tabsCount = 3;
    Map<String, dynamic> myMap =
        plantInfo['data']['main_species']['specifications'];
    var nonNullEntries =
        myMap.entries.where((entry) => entry.value != null).toList();
    var nonNullKeys = nonNullEntries.map((entry) => entry.key).toList();
    var nonNullValues = nonNullEntries.map((entry) => entry.value).toList();
    nonNullKeys = nonNullKeys.sublist(0, nonNullKeys.length - 2);
    nonNullValues = nonNullValues.sublist(0, nonNullValues.length - 2);

    print(nonNullKeys); // Output: [growth_form, growth_habit, growth_rate]
    print(nonNullValues); // Output: [Single Stem, Tree, Moderate]

    return DefaultTabController(
      initialIndex: 0,
      length: tabsCount,
      child: Scaffold(
        appBar: AppBar(
          title: Text(userInput),
          scrolledUnderElevation: 4.0,
          shadowColor: Theme.of(context).shadowColor,
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Overview',
              ),
              Tab(
                text: 'Preparation',
              ),
              Tab(
                text: 'Expectations',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Container(
                color: kLightGreen,
                child: Column(
                  children: [
                    for (var i = 0; i < nonNullKeys.length; i++)
                      PlantDescriptionList(
                        name: nonNullKeys[i],
                        value: nonNullValues[i],
                      ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      backgroundColor: kDarkGreen,
                      foregroundColor: kLightGreen,
                      label: Text('Back'),
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                )),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  PreparationCard(
                    title: 'sowing',
                    description: 'plant description',
                    spacing: 'Row spacing',
                    value: 20,
                  ),
                ],
              ),
            ),
            Container(
                color: kLightGreen,
                child: Column(
                  children: [
                    PlantDescriptionList(
                      name: userInput,
                      value: "20",
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    FloatingActionButton.extended(
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      backgroundColor: kDarkGreen,
                      foregroundColor: kLightGreen,
                      label: Text('Back'),
                      icon: Icon(Icons.arrow_back),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class PreparationCard extends StatelessWidget {
  PreparationCard(
      {required this.title,
      required this.description,
      required this.spacing,
      required this.value});

  String title;
  String description;
  String spacing;
  int value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0, right: 10.0, left: 10.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 10.0,
          color: kDarkGreen,
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  spacing,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text('$value'),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                Text(description),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FloatingActionButton.extended(
                      onPressed: () {
                        int count = 0;
                        Navigator.of(context).popUntil((_) => count++ >= 2);
                      },
                      backgroundColor: kLightGreen,
                      foregroundColor: kDarkGreen,
                      label: Text('Back'),
                      icon: Icon(Icons.arrow_back),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
