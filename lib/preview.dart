import 'package:flutter/material.dart';

class Preview_Screen extends StatefulWidget {
  const Preview_Screen({Key? key}) : super(key: key);

  @override
  State<Preview_Screen> createState() => _Preview_ScreenState();
}

class _Preview_ScreenState extends State<Preview_Screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Column(
             // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "RESUME",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                      letterSpacing: 2),
                ),
                Row(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      child: Image.asset("assets/images/annoymous.jpg",
                          fit: BoxFit.fill),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.blue,
                              spreadRadius: 2,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 2)
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Name",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                            Text("Address", style: TextStyle(fontSize: 12)),
                            Text(
                              "Contact",
                              style: TextStyle(fontSize: 12),
                            ),
                            Text("Email-ID",
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
                Text("Career Object Information",textAlign: TextAlign.justify
                ,style: TextStyle(fontSize: 12)),

                TitleBox("Education Qualification"),
                TitleBox("Projects"),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Project Title Name",textAlign: TextAlign.left
                    ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                    Text("Explain Project in Details",textAlign: TextAlign.left
                        ,style: TextStyle(fontSize: 12)),
                  ],
                ),

                TitleBox("Training"),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Institute Name",textAlign: TextAlign.left
                        ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold)),
                    Text("Enter Year ",textAlign: TextAlign.left
                        ,style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold))
                  ],
                ),
                TitleBox("Technical Skills"),
                TitleBox("Soft Skills"),
                TitleBox("Declaration"),
                Text("I hereby inform you all the statement made above are true, best of my knowledge and belief.")
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget TitleBox(String titlename) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 35,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius:
                BorderRadius.all(Radius.circular(5),),border: Border.all(width: 1)),
        child: Padding(
          padding:EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("$titlename",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      ),
    );
  }
}
