import 'package:flutter/material.dart';
import 'constants.dart';

class DialogStyle extends StatelessWidget {
  String title;
  String message;
  int screenPopCount;

  DialogStyle(
      {required this.title,
      required this.message,
      required this.screenPopCount});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(300),
      child: AlertDialog(
        backgroundColor: kDarkGreen,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            Icon(
              Icons.notifications,
            ),
          ],
        ),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(
              'Dismiss',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              int count = 0;
              Navigator.of(context).popUntil((_) => count++ >= screenPopCount);
            },
          ),
        ],
      ),
    );
  }
}
