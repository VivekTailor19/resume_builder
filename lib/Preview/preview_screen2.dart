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
            Container(width: 180,color: Colors.teal,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 100,width: 100,
                      decoration: BoxDecoration(shape: BoxShape.circle,border: Border.all(color: Colors.white,width: 2)),
                      child: CircleAvatar(radius: 50,backgroundImage: AssetImage("assets/images/anonymous.jpg"),)),
                  SizedBox(height: 15),

                  Text("CONTACT",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20),),
                  Container(height: 2,width: 90,color: Colors.white,),
                  SizedBox(height: 10),

                  Contact(i1: Icon(Icons.location_on_outlined,size: 12,color: Colors.white),data: "address"),
                  Contact(i1: Icon(Icons.phone,size: 12,color: Colors.white),data: "+91 phone"),
                  Contact(i1: Icon(Icons.email_outlined,size: 12,color: Colors.white),data: "email-id"),

                  SizedBox(height: 15),
                  Text("EDUCATION",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20),),
                  Container(height: 2,width: 110,color: Colors.white,),
                  SizedBox(height: 10),
                  Text("Master Degree  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 13,),),
                  Text("University Name",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  Text("Bachalor Degree  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 13,),),
                  Text("University Name",style: TextStyle(color:Colors.white, fontSize: 12,),),
                  Text("HSC  &   Year",style: TextStyle(color:Colors.white, fontWeight: FontWeight.bold,fontSize: 13,),),
                  Text("School Name",style: TextStyle(color:Colors.white, fontSize: 12,),),

                  Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("REFERENCE",style: TextStyle(wordSpacing: 3,color: Colors.white,fontSize: 20),),
                      Container(height: 2,width: 110,color: Colors.white,)
                    ],
                  ),
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




            Container(width: 220,child: Padding(
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

                  Topic("OBJECTIVE"),
                  ExplainDetails("objective 2 explain"),




                  Topic("PROJECT"),

                  Text(" 1 PROJECT Name",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                  ExplainDetails("project 1 explain"),
                  Text(" 2 PROJECT Name",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                  ExplainDetails("project 2 explain"),



                  Topic("EXPERIENCE"),
                  Text("Company NAME      &        YEAR",style: TextStyle(fontSize: 13,fontWeight: FontWeight.bold )),
                  ExplainDetails("work explain")





                  //Name
                  //Profession
                  //Objective
                  //project
                  //Experience
                  //Skills Tech Soft


              ],),
            ),)],
        ),


      ),
    );
  }

  Widget Contact({Icon? i1, String? data})
  {
    return Padding(
      padding: const EdgeInsets.only(left: 35.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(icoon,size: 12,),
          Container(alignment: Alignment.centerRight,width: 20,child: i1!),
          SizedBox(width: 15),
          Container(alignment: Alignment.centerLeft,width: 110,child: Text("$data",
            style: TextStyle(fontSize: 12,color: Colors.white),textAlign: TextAlign.justify,)),

        ],
      ),
    );
  }

  Widget ExplainDetails(String explain)
  {
    return Text("$explain",style: TextStyle(fontSize: 12),textAlign: TextAlign.justify);
  }

  Widget Topic(String topic)
  {
    return Text("$topic",style: TextStyle(letterSpacing: 2,fontSize: 20 ));
  }
}
