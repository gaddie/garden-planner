import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garden_planner/constants.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'home.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const plant_apiKey = "OiHit2-fRM0LQcvuX_9IQWDN0LrX9gdmdfoIROyTJpY";
const weather_apiKey = "9a91e15126db6161674d7e5c0dab74ac";

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  var lat;
  var lon;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      //nothing
    }
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    lon = position.longitude;
    getWeatherData();
  }

  Future getWeatherData() async {
    var url =
        "https://api.openweathermap.org/data/2.5/weather?units=metric&lon=$lon&lat=$lat&appid=$weather_apiKey";

    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    String data = response.body;
    var decodeData = jsonDecode(data);

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Home(
                  weatherInfo: decodeData,
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
    ));
  }
}
