import 'dart:html';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List edu = ["B.E.","M.B.B.S","Ph.D","SSC","HSC","B.Sc"];
  List techSkill = ["Basic Programming","Web Designing","Network Security","Mobile Developing","Database"];
  List techselect = [false,false,false,false,false];
  bool project = false;
  String? eduSel ;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text("Setting"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("Privacy"),
                  onTap: () {},
                ),
                PopupMenuItem(
                  child: Text("Help"),
                  onTap: () {},
                ),
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading:
                    Icon(Icons.person_outline, size: 30, color: Colors.white),
                title: Text(
                  "Personal Information",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      label: Text(
                        "Enter Full Name",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      label: Text(
                        "Enter Address ",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      label: Text(
                        "Enter Email ",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      border: OutlineInputBorder(),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2)),
                      label: Text(
                        "Enter Contact ",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading:
                    Icon(Icons.school_outlined, size: 30, color: Colors.white),
                title: Text(
                  "Education",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: DropdownButton(dropdownColor: Colors.black54,
                  isExpanded: true,
                  items: edu.map((e) => DropdownMenuItem(child: Text("$e",style: TextStyle(color: Colors.white,fontSize: 20)),value: e,)).toList(),
                  value: eduSel,
                  //alignment: Alignment.center,
                  onChanged: (value) { setState(() {
                    eduSel = value as String;
                    print(eduSel);
                  });},
                  hint: Text("  *   *   *   Enter Education  *   *   *   ",style: TextStyle(fontSize: 20,color: Colors.white),),
                ),
              ),
              SizedBox(height: 20),
              ListTile(
                leading:
                Icon(Icons.event_available, size: 30, color: Colors.white),
                title: Text(
                  "Technical Skills",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                trailing: Icon(
                  Icons.check_box_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              CheckboxListTile(value: techselect[0], onChanged: (value){
                setState(() {
                  techselect[0] = value;
                });
              },checkColor: Colors.black,
                activeColor: Colors.white,
              title: Text("${techSkill[0]}",style: TextStyle(fontSize: 20,color: Colors.white),),),
              CheckboxListTile(value: techselect[1], onChanged: (value){
                setState(() {
                  techselect[1] = value;
                });
              },checkColor: Colors.black,
                activeColor: Colors.white,
              title: Text("${techSkill[1]}",style: TextStyle(fontSize: 20,color: Colors.white),),),
              CheckboxListTile(value: techselect[2], onChanged: (value){
                setState(() {
                  techselect[2] = value;
                });
              },checkColor: Colors.black,
                activeColor: Colors.white,
              title: Text("${techSkill[2]}",style: TextStyle(fontSize: 20,color: Colors.white),),),
              CheckboxListTile(value: techselect[3], onChanged: (value){
                setState(() {
                  techselect[3] = value;
                });
              },
                checkColor: Colors.black,
                activeColor: Colors.white,
              title: Text("${techSkill[3]}",style: TextStyle(fontSize: 20,color: Colors.white),),),
              CheckboxListTile(value: techselect[4], onChanged: (value){
                setState(() {
                  techselect[4] = value;
                });
              },checkColor: Colors.black,
                activeColor: Colors.white,
              title: Text("${techSkill[4]}",style: TextStyle(fontSize: 20,color: Colors.white),),),
              SizedBox(height: 20),
              ListTile(
                leading:
                Icon(Icons.workspace_premium_outlined, size: 30, color: Colors.white),
                title: Text(
                  "Project",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                trailing:
                  Switch(value: project,onChanged: (value) {
                    setState(() {
                      project = value!;
                    });
                  },activeColor: Colors.white,)
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Visibility(visible: project ,
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2)),
                        hintText:
                        "Enter Project Name",
                        hintStyle: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(visible: project ,
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white, width: 2)),
                            hintText:
                          "Enter Project in Details",
                          hintStyle: TextStyle(color: Colors.white),
                        )),
                  ),
              ),





            ],
          ),
        ),
      ),
    );
  }
}
