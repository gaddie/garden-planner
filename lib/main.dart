import 'package:flutter/material.dart';
import 'home.dart';
import 'constants.dart';
import 'loading_screen.dart';

void main() {
  runApp(GardenPlanner());
}

class GardenPlanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kLightGreen,
        appBarTheme: AppBarTheme(
          color: kDarkGreen,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingScreen(),
        '/home': (context) => Home(),
      },
    );
  }
}
