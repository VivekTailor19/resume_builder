import 'package:flutter/material.dart';
import 'package:resume_builder/homescreen.dart';
import 'package:resume_builder/new_resume.dart';
import 'package:resume_builder/preview.dart';
import 'package:resume_builder/profile.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/"       : (context) => HomeScreen(),
      "profile" : (context) => Profile(),
      "new_resume" : (context) => New_Resume(),
      "preview" : (context) => Preview_Screen(),


    },
  ));
}
