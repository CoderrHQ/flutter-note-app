import 'package:flutter/material.dart';

const kTextFieldStyle = InputDecoration(
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 0.45,
    ),
  ),
  disabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.white,
      width: 1,
    ),
  ),
  hintText: "Title",
  hintStyle: TextStyle(
    fontSize: 20,
    color: Color(0xff9A9A9A),
  ),
);

const kContainerBoxDecoration = BoxDecoration(
  color: Color(0xff3B3B3B),
  borderRadius: BorderRadius.all(
    Radius.circular(14),
  ),
);

const kBoldWhiteText = TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
