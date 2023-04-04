import 'package:flutter/material.dart';
import 'constants.dart';
import 'info_screen.dart';
import 'plant_loading_screen.dart';

var userInput;

class Home extends StatefulWidget {
  Home({this.weatherInfo});
  final weatherInfo;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int temperature;
  late String cityName;
  var windSpeed;
  var humidity;
  var pressure;
  var condition;
  var weatherIcon;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    updateUI(widget.weatherInfo);
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  void updateUI(weatherData) {
    temperature = weatherData['main']['temp'].toInt();
    cityName = weatherData['name'];
    windSpeed = weatherData['wind']['speed'];
    humidity = weatherData['main']['humidity'];
    pressure = weatherData['main']['pressure'];
    condition = weatherData['weather'][0]['id'];
    weatherIcon = getWeatherIcon(condition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Garden Planner'),
      ),
      body: ListView(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF617143), //New
                          blurRadius: 25.0,
                          offset: Offset(0, 5))
                    ],
                    image: DecorationImage(
                      image: AssetImage("images/weather-bg.jpeg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.dstATop),
                    ),
                    color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(13))),
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          'Weather',
                          style: TextStyle(
                            fontSize: 30.0,
                          ),
                        ),
                        Text(
                          weatherIcon,
                          style: TextStyle(fontSize: 50.0),
                        ),
                        Text(
                          '$temperature°',
                          style: TextStyle(
                            fontSize: 40.0,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherData(
                          icon: Icons.water_drop,
                          value: '$humidity',
                          label: 'humidity',
                        ),
                        WeatherData(
                          icon: Icons.wind_power,
                          value: '$windSpeed',
                          label: 'Wind speed',
                        ),
                        WeatherData(
                          icon: Icons.thermostat,
                          value: '$pressure',
                          label: 'pressure',
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.location_city),
                        Text(cityName),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Color(0xFF617143),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20.0),
                        topLeft: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(right: 10.0, left: 10.0, top: 20.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          onChanged: (event) {
                            userInput = event;
                          },
                          decoration: kTextFieldDecoration.copyWith(
                              hintText: 'Crop name'),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: 10.0, right: 10.0, left: 10.0, bottom: 20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PlantLoadingScreen()));
                          },
                          style: ElevatedButton.styleFrom(
                            elevation:
                                10, // set the elevation to 10 logical pixels
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0),
                            ),
                            backgroundColor: kLightGreen,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(top: 18.0, bottom: 18.0),
                            child: Text(
                              'Show more about this crop',
                              style: TextStyle(
                                color: kDarkGreen,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                'YOUR PROJECTS',
                style: TextStyle(
                  color: kDarkGreen,
                  fontWeight: FontWeight.w300,
                  fontSize: 20.0,
                ),
              ),
            ),
            Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                  height: 180.0,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black, //New
                          blurRadius: 25.0,
                          offset: Offset(0, 5))
                    ],
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage("images/farm.jpeg"),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.7), BlendMode.dstATop),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Project Name',
                          style: TextStyle(
                              fontWeight: FontWeight.w900, fontSize: 20.0)),
                      Text('Harvesting date'),
                      Text('Weeks'),
                    ],
                  ) // add your content here
                  ),
            )
          ],
        ),
      ]),
    );
  }
}

class WeatherData extends StatelessWidget {
  var icon;
  var label;
  var value;

  WeatherData({this.value, this.label, this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 12.0,
        ),
        Text(
          value,
          style: TextStyle(fontSize: 10.0),
        ),
        Text(label, style: TextStyle(fontSize: 10.0)),
      ],
    );
  }
}
