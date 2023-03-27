import 'package:flutter/material.dart';

class Resume_02 extends StatefulWidget {
  const Resume_02({Key? key}) : super(key: key);

  @override
  State<Resume_02> createState() => _Resume_02State();
}

class _Resume_02State extends State<Resume_02> {

  TextEditingController name_2 = TextEditingController();
  TextEditingController add_2 = TextEditingController();
  TextEditingController prof_2 = TextEditingController();
  TextEditingController cont_2 = TextEditingController();
  TextEditingController email_2 = TextEditingController();

  TextEditingController sc = TextEditingController();
  TextEditingController sc_year = TextEditingController();
  TextEditingController col = TextEditingController();
  TextEditingController col_year = TextEditingController();
  TextEditingController mas = TextEditingController();
  TextEditingController mas_year = TextEditingController();

  TextEditingController obj = TextEditingController();

  TextEditingController proj_1 = TextEditingController();
  TextEditingController proj_data_1 = TextEditingController();
  TextEditingController proj_2 = TextEditingController();
  TextEditingController proj_data_2 = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.accessibility_new_rounded,size: 15,weight: 2),
          title: Text(
            "CV MAKER",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                letterSpacing: 4,
                wordSpacing: 2),
          ),
        ),
        body: Column(
          children: [
            ExpansionTile(
              leading: Icon(Icons.person_outline,size: 14),
              title: Text("PERSONAL INFORMATION",style: TextStyle(fontSize: 14,wordSpacing: 3)),
              children: [         // NAME ADDRESS PROFESSION CONTACT EMAIL
                Personal(title: "Enter Name Here...", kboard: TextInputType.text, data:name_2),
                Personal(title: "Enter Profession", kboard: TextInputType.text, data:prof_2),
                Personal(title: "Enter Address", kboard: TextInputType.streetAddress, data:add_2),
                Personal(title: "Enter 10 digit Contact No", kboard: TextInputType.phone, data:cont_2),
                Personal(title: "Enter Proper E-mail Id", kboard: TextInputType.emailAddress, data:email_2),
              ],
            ), // Personal Information

            ExpansionTile(
              leading:Icon(Icons.school_outlined,size: 14),
              title: Text("EDUCATION",style: TextStyle(fontSize: 14,wordSpacing: 3)),
              children: [   //  SCHOOLING COLLAGE MASTER title year board
                Education(data: sc,year: sc_year,edu_title: "Enter Maximum School Year",pass_year: "Enter Passing Year",kbtitle: TextInputType.text,kbyear: TextInputType.phone),
                Education(data: col,year: col_year,edu_title: "Enter Collage Degree",pass_year: "Enter Passing Year",kbtitle: TextInputType.text,kbyear: TextInputType.phone),
                Education(data: mas,year: mas_year,edu_title: "Enter Master Degree",pass_year: "Enter Passing Year",kbtitle: TextInputType.text,kbyear: TextInputType.phone),

              ],
            ),

            Text("OBJECTIVE",style: TextStyle(fontSize: 14,wordSpacing: 3)),    //  SENTENCEs
            TextFormField(

                controller: obj,
                keyboardType: TextInputType.text,

                decoration: InputDecoration(

                  hintText: "Secure a responsible career opportunity to fully utilize my training and skills, while making a significant contribution to the success of the company.",
                  hintStyle: TextStyle(fontSize: 13),

                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                          width: 2)),
                  border: OutlineInputBorder(),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black12,
                          width: 2)),

                ),

              ),


            ExpansionTile(title: Text("PROJECT",style: TextStyle(fontSize: 14,wordSpacing: 3)),
            children: [
              Project(hinttitle: "Enter Project 1 Title",pr_title: proj_1,pr_data: proj_data_1,pr_data_hint: "Enter Project 1 Infomation"),
              Project(hinttitle: "Enter Project 2 Title",pr_title: proj_2,pr_data: proj_data_2,pr_data_hint: "Enter Project 2 Infomation"),
            ],),        //     pROJECT   NAME AND DETAILS


            ExpansionTile(title: Text("EXPERIENCE",style: TextStyle(fontSize: 14,wordSpacing: 3)),),
            //COMPANY NAME AND YEAR AND WORK
            ExpansionTile(title: Text("REFERENCE",style: TextStyle(fontSize: 14,wordSpacing: 3)),),
            // NAME EMAIL COMPANY JOBTITLE
          ],
        ),
      ),
    );
  }

  Widget Personal({TextEditingController? data, String? title,TextInputType? kboard})
  {
    return TextFormField(

      controller: data,
      keyboardType: kboard,

      decoration: InputDecoration(

        hintText: "$title",
        hintStyle: TextStyle(fontSize: 13),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                width: 2)),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12,
                width: 2)),

      ),

    );
  }

  Widget Education({
    TextEditingController? data,TextEditingController? year,
    String? edu_title, String? pass_year,TextInputType? kbtitle,TextInputType? kbyear})
  {
  return ListTile(
    leading:TextField(keyboardType: kbtitle,
        controller: data,
        decoration: InputDecoration(hintText: "$edu_title",hintStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12,
                  width: 2)),
        )),
    trailing: TextField(keyboardType: kbyear,
        controller: year,
        decoration: InputDecoration(hintText: "$pass_year",hintStyle: TextStyle(fontSize: 13),
          border: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black12,
                  width: 2)),
        )),);
  }

  Widget Project({TextEditingController? pr_title, String? hinttitle,TextEditingController? pr_data, String? pr_data_hint})
  {
    return Column(
      children: [
      TextFormField(

      controller: pr_title,
      keyboardType: TextInputType.text,

      decoration: InputDecoration(

        hintText: "$pr_title",
        hintStyle: TextStyle(fontSize: 13),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                width: 2)),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12,
                width: 2)),

      ),

    ),
      TextFormField(

      controller: pr_data,
      keyboardType: TextInputType.text,

      decoration: InputDecoration(

        hintText: "$pr_data_hint",
        hintStyle: TextStyle(fontSize: 13),

        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                width: 2)),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black12,
                width: 2)),

      ),

    ),
      ],
    );
  }



}
