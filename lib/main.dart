import 'package:flutter/material.dart';
import 'package:resume_builder/homescreen.dart';
import 'package:resume_builder/new_resume.dart';
import 'package:resume_builder/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      //"/" : (context) => HomeScreen(),
      "profile" :(context) => Profile(),
      //"pro" : (context) => New_Resume(),
      "/" : (context) => New_Resume(),
    },
  ));
}
