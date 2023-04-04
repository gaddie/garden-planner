import 'constants.dart';
import 'package:flutter/material.dart';

//builder of a list in the overview and the expectations body
class PlantDescriptionList extends StatelessWidget {
  String name;
  String value;

  PlantDescriptionList({required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 17.0,
              color: kDarkGreen,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 17.0,
              color: kDarkGreen,
            ),
          ),
        ],
      ),
    );
  }
}
