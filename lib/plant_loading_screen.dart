import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garden_planner/info_screen.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'constants.dart';

const plant_apiKey = "OiHit2-fRM0LQcvuX_9IQWDN0LrX9gdmdfoIROyTJpY";

var plantName = userInput;

class PlantLoadingScreen extends StatefulWidget {
  var plantInfo;

  PlantLoadingScreen({required this.plantInfo});
  @override
  _PlantLoadingScreenState createState() => _PlantLoadingScreenState();
}

class _PlantLoadingScreenState extends State<PlantLoadingScreen> {
  var plantId;

  @override
  void initState() {
    super.initState();
    getPlantId(widget.plantInfo);

    // Call getPlantId function in initState
  }

  Future getPlantId(dynamic plantInfo) async {
    var url =
        "https://trefle.io/api/v1/plants/search?token=$plant_apiKey&q=$plantInfo";

    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    String data = response.body;
    var decodeData = jsonDecode(data);
    plantId = decodeData['data'][0]['id'];

    // Call getPlantDescription function after getting the plant ID
    getPlantDescription();
  }

  Future getPlantDescription() async {
    var url = "https://trefle.io/api/v1/plants/$plantId?token=$plant_apiKey";

    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    String data = response.body;
    var decodeData = jsonDecode(data);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DescriptionScreen(
                  plantInfo: decodeData,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCircle(
          color: kDarkGreen,
          size: 50.0,
        ),
      ),
    );
  }
}
