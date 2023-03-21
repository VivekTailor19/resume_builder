import 'package:flutter/material.dart';

class Preview_02 extends StatefulWidget {
  const Preview_02({Key? key}) : super(key: key);

  @override
  State<Preview_02> createState() => _Preview_02State();
}

class _Preview_02State extends State<Preview_02> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              child: Container(width: 120,color: Colors.teal,child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(height: 100,width: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 2)),
                      child: CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/images/anonymous.jpg"),)),

                  Text("CONTACT",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20,
                    decoration: TextDecoration.underline,decorationColor: Colors.white,decorationThickness: 2,),),
                  ListTile(leading: Icon(Icons.location_on_outlined,size: 12,color: Colors.white),
                    title: Text("Address",style: TextStyle(fontSize: 12,color: Colors.white),textAlign: TextAlign.justify),),
                  ListTile(leading: Icon(Icons.phone,size: 12,color: Colors.white),
                    title: Text("+91 PhoneNumber",style: TextStyle(fontSize: 12,color: Colors.white)),),
                  ListTile(leading: Icon(Icons.email_outlined,size: 12,color: Colors.white),
                    title: Text("Email - ID",style: TextStyle(fontSize: 12,color: Colors.white)),),


                  Text("EDUCATION",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20,
                    decoration: TextDecoration.underline,decorationColor: Colors.white,decorationThickness: 2,),),
                  Text("Master Degree  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 14,),),
                  Text("University Name",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  Text("Bachalor Degree  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 14,),),
                  Text("University Name",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  Text("HSC  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 14,),),
                  Text("School Name",style: TextStyle(color:Colors.white, fontSize: 12,),),

                  Text("REFERENCE",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20,
                    decoration: TextDecoration.underline,decorationColor: Colors.white,decorationThickness: 2,),),
                  Text("Refee Name",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 13,),),
                  Text("School Name",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  SizedBox(height: 5),
                  Text("Email :   EMail ID",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  Text("Contact :  +91 Contact Number",style: TextStyle(color:Colors.white, fontSize: 12,),),




                  //CircleAvatar Photo
                  //Contact(),
                  //Education(),
                  //Reference(),
                ],
              ),),
            ),




            Expanded(
              child: Container(width: 200,child: Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Container(
                        height: 150,alignment: Alignment.center,color: Colors.black26,
                        child: Column(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                          Text("NAME OF PERSON",style: TextStyle(fontSize: 18,wordSpacing: 3,letterSpacing: 1),),
                          SizedBox(height: 10),
                          Text("Profession OF PERSON",style: TextStyle(fontSize: 14,wordSpacing: 2,letterSpacing: 1),),
                        ],),
                        ),

                    Text("OBJECTIVE Title",style: TextStyle(letterSpacing: 2,fontSize: 20 )),
                    Text("objective in details",style: TextStyle(fontSize: 12),textAlign: TextAlign.justify),




                    Text("PROJECT",style: TextStyle(letterSpacing: 2,fontSize: 20 )),

                    Text(" 1 PROJECT Name",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                    Text("objective in details",style: TextStyle(fontSize: 12),textAlign: TextAlign.justify),
                    Text(" 2 PROJECT Name",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                    Text("objective in details",style: TextStyle(fontSize: 12),textAlign: TextAlign.justify),


                    Text("EXPERIENCE",style: TextStyle(letterSpacing: 2,fontSize: 20 )),
                    Text("Company NAME      &        YEAR",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                    Text("EXPLAIN WORK",style: TextStyle(fontSize: 13),textAlign: TextAlign.justify),





                    //Name
                    //Profession
                    //Objective
                    //project
                    //Experience
                    //Skills Tech Soft


                ],),
              ),),
            )],
        ),


      ),
    );
  }
}
