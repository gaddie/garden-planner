import 'package:flutter/material.dart';
import 'package:garden_planner/constants.dart';
import 'package:garden_planner/home.dart';
import 'plant_description_list.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

    var plantImg = plantInfo['data']['image_url'];
    var isNull = plantInfo['data']['main_species']['images']['fruit'];

    if (isNull == null) {
      print("null");
    } else {
      var fruitImg =
          plantInfo['data']['main_species']['images']['fruit'][0]['image_url'];

      var imgListLength =
          plantInfo['data']['main_species']['images']['fruit'].length;

      for (var i = 0; i < imgListLength; i++) {
        print(plantInfo['data']['main_species']['images']['fruit'][i]
            ['image_url']);
      }
    }

    var commonAreas =
        plantInfo['data']['main_species']['distribution']['native'];

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
                text: 'Locations',
              ),
              Tab(
                text: 'Images',
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
            Container(
                color: kLightGreen,
                child: Column(
                  children: [
                    for (var i = 0; i < commonAreas.length; i++)
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            '◉' + ' ' + commonAreas[i],
                            style: TextStyle(
                              color: kDarkGreen,
                              fontSize: 20.0,
                            ),
                          ),
                        ],
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
            Container(
                color: kLightGreen,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.0,
                    ),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 200.0,
                        autoPlay: true,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.3,
                      ),
                      items: [1, 2, 3, 4, 5].map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 0.2),
                                child: isNull == null
                                    ? Image.network(
                                        'https://admin.azbigmedia.com/wp-content/uploads/2021/08/California-farms.jpg',
                                        fit: BoxFit.fill,
                                      )
                                    : Image.network(
                                        plantInfo['data']['main_species']
                                                ['images']['leaf'][i - 1]
                                            ['image_url'],
                                        fit: BoxFit.fill,
                                      ),
                              ),
                            );
                          },
                        );
                      }).toList(),
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

// for (var i = 0; i < commonAreas.length; i++)
// AreasGrownCard(
// name: '◉' + ' ' + commonAreas[i],
// ),
