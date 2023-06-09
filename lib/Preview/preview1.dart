import 'dart:io';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

import 'package:resume_builder/resumeDataModal.dart';

import '../pdf_view/pdf1.dart';

class Preview_Screen extends StatefulWidget {
  const Preview_Screen({Key? key}) : super(key: key);

  @override
  State<Preview_Screen> createState() => _Preview_ScreenState();
}

class _Preview_ScreenState extends State<Preview_Screen> {
  @override
  Widget build(BuildContext context) {
    ResumeModal rm = ModalRoute.of(context)!.settings.arguments as ResumeModal;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Resume Builder"),
          centerTitle: true,
          actions: [
            InkWell(onTap: () async {
            await Printing.layoutPdf(onLayout: (format) =>  savePDF(rm));
          },child: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.save_alt_rounded),
          ))],
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      "RESUME",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                          letterSpacing: 2),
                    ),
                  ),
                  Divider(color: Colors.blue.shade50, thickness: 2),
                  Row(
                    children: [
                      // ClipOval(
                      // child: FileImage(
                      // File("${rm.u_path}"),
                      //     ),
                      //     ),

                      CircleAvatar(
                          radius: 75,
                          backgroundImage: FileImage(
                            File("${rm.u_path}"),
                          )),
                      Container(
                        height: 150,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("${rm.u_name}",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue)),
                              Text("${rm.u_address}",
                                  style: TextStyle(fontSize: 12)),
                              Text("${rm.u_contact}",
                                  style: TextStyle(fontSize: 12)),
                              Text("${rm.u_email}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue))
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  TitleBox("Career Objective"),
                  Text("${rm.u_career}",
                      textAlign: TextAlign.justify,
                      style: TextStyle(fontSize: 12)),
                  TitleBox("Education Qualification"),
                  Text("${rm.u_education} ",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                  TitleBox("Projects"),
                  Text("${rm.u_project}",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                  Text("${rm.u_project_details}",
                      textAlign: TextAlign.left, style: TextStyle(fontSize: 12)),
                  TitleBox("Training"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("${rm.u_training_place}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold)),
                      Text("${rm.u_training_year}",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold))
                    ],
                  ),
                  TitleBox("Technical Skills"),
                  Text(
                    "${rm.u_tech_skills}",
                    style: TextStyle(fontSize: 12),
                  ),
                  TitleBox("Skills"),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                  rm.u_skill!.map((e) => lakhan(e)).toList()
                  ),
                  TitleBox("Expected Salary"),
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      [
                        Text("${rm.rangevalue!.start} -  ${rm.rangevalue!.end}",style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                  ),


                  TitleBox("Soft Skills"),
                  Text(
                    "${rm.u_soft_skills}",
                    style: TextStyle(fontSize: 12),
                  ),
                  TitleBox("References"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 160,
                          //alignment: Alignment.centerLeft,
                          child: Text(
                            "${rm.u_ref}",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                      Container(
                          width: 160,
                         // alignment: Alignment.centerLeft,
                          child: Text(
                            "${rm.u_refjob}",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 160,
                          //alignment: Alignment.centerLeft,
                          child: Text(
                            "${rm.u_refcompany}",
                            style: TextStyle(fontSize: 11),
                          )),
                      Container(
                          width: 160,
                          //alignment: Alignment.centerLeft,
                          child: Text(
                            "${rm.u_refemail}",
                            style: TextStyle(fontSize: 11),
                          )),
                    ],
                  ),
                  TitleBox("Declaration"),
                  Text(
                      "I hereby inform you all the statement made above are true, best of my knowledge and belief."),
                  Container(
                    height: 15,
                    alignment: Alignment.centerRight,
                    child: Text("${rm.u_name}",
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget TitleBox(String titlename) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 30,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
            border: Border.all(width: 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("$titlename",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      ),
    );
  }

  Widget lakhan(String sk)
  {
    return Text("₹ $sk");
  }
}
