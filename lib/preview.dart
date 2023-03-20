import 'package:flutter/material.dart';
import 'package:resume_builder/resumeDataModal.dart';

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
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(alignment: Alignment.center,
                  child: Text(
                    "RESUME",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        letterSpacing: 2),
                  ),
                ),
                Divider(color: Colors.blue.shade50,thickness: 2),
                Row(
                  children: [
                    CircleAvatar(radius: 75,
                        backgroundImage: AssetImage(
                          "assets/images/anonymous.jpg",
                        )),
                    Container(
                      height: 150,
                      child: Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("${rm.u_name}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue)),
                            Text("${rm.u_address}", style: TextStyle(fontSize: 12)),
                            Text("${rm.u_contact}", style: TextStyle(fontSize: 12)),
                            Text("${rm.u_email}", style:TextStyle(fontSize: 12,fontWeight: FontWeight.bold, color: Colors.blue))
                          ],
                        ),
                      ),
                    )
                  ],
                ),

                TitleBox("Career Objective"),
                Text("${rm.u_career}", textAlign: TextAlign.justify
                    , style: TextStyle(fontSize: 12)),

                TitleBox("Education Qualification"),
                Text("${rm.u_education} ", textAlign: TextAlign.left
                    , style: TextStyle(fontSize: 12)),

                TitleBox("Projects"),
                Text("${rm.u_project}", textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                Text("${rm.u_project_details}", textAlign: TextAlign.left
                    , style: TextStyle(fontSize: 12)),


                TitleBox("Training"),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${rm.u_training_place}", textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                    Text("${rm.u_training_year}", textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold))
                  ],
                ),
                TitleBox("Technical Skills"),
                Text("${rm.u_tech_skills}",style: TextStyle(fontSize: 12),),

                TitleBox("Soft Skills"),
                Text("${rm.u_soft_skills}",style: TextStyle(fontSize: 12),),

                TitleBox("References"),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 40,alignment:Alignment.centerLeft,child: Text("${rm.u_ref}  ==  ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                    Container(width: 40,alignment:Alignment.centerLeft,child: Text("${rm.u_refjob}  ==  ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)),
                  ],
                ),
                Row(mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(width: 30,alignment:Alignment.centerLeft,child: Text("${rm.u_refcompany}",style: TextStyle(fontSize: 13),)),
                    Container(width: 30,alignment:Alignment.centerLeft,child: Text("${rm.u_refemail}",style: TextStyle(fontSize: 13),)),
                  ],
                ),



                TitleBox("Declaration"),
                Text("I hereby inform you all the statement made above are true, best of my knowledge and belief."),
                Container(
                  height: 20, alignment: Alignment.centerRight,
                  child: Text("${rm.u_name}", style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
                )
              ],
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
        height: 35,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
            borderRadius:
            BorderRadius.all(Radius.circular(5),),
            border: Border.all(width: 1)),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text("$titlename",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
        ),
      ),
    );
  }
}
