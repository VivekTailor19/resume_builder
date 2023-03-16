import 'package:flutter/material.dart';
import 'package:resume_builder/homescreen.dart';
import 'package:resume_builder/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => HomeScreen(),
      "profile" :(context) => Profile(),
    },
  ));
}
