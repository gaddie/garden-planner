import 'package:flutter/material.dart';

const kLightGreen = Color(0xFFE9EDC9);
const kDarkGreen = Color(0xFF617143);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Enter a value',
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE9EDC9), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFE9EDC9), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
