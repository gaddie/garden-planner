// import 'package:http/http.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
//
// const plant_apiKey = "OiHit2-fRM0LQcvuX_9IQWDN0LrX9gdmdfoIROyTJpY";
// const weather_apiKey = "9a91e15126db6161674d7e5c0dab74ac";
//
// class WeatherData extends StatefulWidget {
//   void getLocation() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.low);
//
//     print(position.longitude);
//   }
//
//   void getWeatherData() async {
//     Response response = await get(
//         "https://api.openweathermap.org/data/2.5/weather?appid=${weather_apiKey}"
//             as Uri);
//     print(response.body);
//   }
//
//   @override
//   State<WeatherData> createState() => _WeatherDataState();
// }
//
// class _WeatherDataState extends State<WeatherData> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }
// }
