import 'package:flutter/material.dart';
import 'package:resume_builder/Preview/preview_screen2.dart';
import 'package:resume_builder/homescreen.dart';
import 'package:resume_builder/resumes/new_resume.dart';
import 'package:resume_builder/Preview/preview1.dart';

import 'package:resume_builder/practice.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/"       : (context) => HomeScreen(),
      "new_resume" : (context) => New_Resume(),
      "preview" : (context) => Preview_Screen(),
      "preview_02" : (context) => Preview_02(),
      //"/" : (context) => Preview_02(),



    },
  ));
}

//2412 x 1080 Pixels