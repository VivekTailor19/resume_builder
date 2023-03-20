import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'resumeDataModal.dart';

class New_Resume extends StatefulWidget {
  const New_Resume({Key? key}) : super(key: key);

  @override
  State<New_Resume> createState() => _New_ResumeState();
}

class _New_ResumeState extends State<New_Resume> {

  TextEditingController user_name = TextEditingController();
  TextEditingController user_address = TextEditingController();
  TextEditingController user_email = TextEditingController();
  TextEditingController user_contact = TextEditingController();

  TextEditingController user_project = TextEditingController();
  TextEditingController user_project_info = TextEditingController();

  TextEditingController user_traning= TextEditingController();
  TextEditingController user_traning_year= TextEditingController();

  TextEditingController ref_name = TextEditingController();
  TextEditingController ref_job = TextEditingController();
  TextEditingController ref_company = TextEditingController();
  TextEditingController ref_email = TextEditingController();




  Color whited = Colors.white;
  Color blacked = Colors.black;

  String country = "Indian";
  String? countrySel;

  String stream = "";
  List edu = ["B.E.","M.B.B.S","Ph.D","SSC","HSC","B.Sc"];
  String eduSel = "B.E.";


  String exp = "Experience";
  String? expSel;

  List softSkill = ["Public Speaking","LeaderShip","Time Management","Critical Thinking","Positive attitude"];
  List softselect = [false, false, false, false, false];
  var softskills = "";


  List techSkill = ["Basic Programming","Web Designing","Network Security","Mobile Developing","Database"];
  List techselect = [false, false, false, false, false];
  var techskills = "";

  TextEditingController objective = TextEditingController();

  bool project = false;

  ResumeModal rm_new = ResumeModal();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: SafeArea(
      child:Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.lightBlueAccent,Colors.blue,Colors.blueAccent])),
              alignment: Alignment.center,
              child: Text("Profile",style: TextStyle(fontSize: 25,color: Colors.white),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                leading: Icon(Icons.person_outline, size: 30, color: Colors.lightBlue),
                title: Text("Personal Information", style: TextStyle(fontSize: 30,),),
                trailing: Text(""),

                children: [
                  PersonalDetails(title: "Name", hintname: "Your Full Name",data: user_name),
                  PersonalDetails(title: "Address", hintname: "Main Road, Surat",data: user_address),
                  PersonalDetails(title: "Email", hintname: "myresume@gmail.com",data: user_email),
                  PersonalDetails(title: "Contact", hintname: "998877123",data: user_contact),
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8.0, top: 5),
                    child: Container(color: Colors.white,
                      child:ExpansionTile(
                        leading: Icon(Icons.public,size: 30,color: Colors.lightBlue),
                        title: Text("Nationality",style: TextStyle(fontSize: 30 )),
                        trailing: Text("$country",style: TextStyle(fontSize: 20)),
                        children: [
                          NationalityRadio("Indian"),
                          NationalityRadio("American"),
                          NationalityRadio("Chinese"),
                          NationalityRadio("Swiss"),
                          NationalityRadio("Japanese"),
                          NationalityRadio("Korean"),
                          NationalityRadio("English"),
                        ],),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                leading: Icon(Icons.local_library_rounded, size: 30, color: Colors.lightBlue),
                title: Text("Education", style: TextStyle(fontSize: 30,),),
                trailing: Text("$eduSel in $stream"),
                children: [
                  DropdownButton(
                    isExpanded: true,
                    items: edu.map((e) =>
                        DropdownMenuItem(
                          child: Text("$e",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                          value: e,
                          alignment: Alignment.center,)).toList(),
                    value: eduSel,
                    //alignment: Alignment.center,
                    onChanged: (value) {
                      setState(() {
                        eduSel = value as String;
                        print(eduSel);
                      });
                    },
                    hint: Text("Select Education",
                      style: TextStyle(fontSize: 20,color: Colors.black26),),
                  ),
                  TextField(
                    //controller: stream,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.black),
                      onChanged: (value) {
                        setState(() {
                          stream = value;
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                                width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12,
                                width: 2)),
                        hintText:"Enter Stream Name",
                        hintStyle: TextStyle(color: Colors.black26,fontSize: 20),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                title: Text("Experience", style: TextStyle(fontSize: 30,)),
                leading: Icon(Icons.work, size: 30, color: Colors.lightBlue),
                trailing: Text(""),
                children: [
                  Exp_Type("Fresher"),
                  Exp_Type("Experiance")
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ExpansionTile(
                leading: Icon(Icons.event_available, size: 30,  color: Colors.lightBlue),
                title: Text("Soft Skills", style: TextStyle(fontSize: 30),),
                trailing: Text(""),

                children:
                softSkill.asMap().entries.map((e) =>
                    SoftCheck(soft_name: softSkill[e.key],soft_index: e.key)).toList(),

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ExpansionTile(
                leading: Icon(Icons.construction_rounded, size: 30,  color: Colors.lightBlue),
                title: Text("Technical Skills", style: TextStyle(fontSize: 30),),
                trailing: Text(""),

                children:
                techSkill.asMap().entries.map((e) =>
                    TechCheck(tech_name: techSkill[e.key],tech_index: e.key)).toList(),

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                leading: Icon(Icons.rocket_launch_rounded, size: 30, color: Colors.lightBlue),
                title: Text("Objective", style: TextStyle(fontSize: 30,),),
                trailing: Text(""),

                children: [
                  TextField(
                      controller: objective,
                      textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.black),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                                width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black12,
                                width: 2)),
                        hintText: "To Work in an environment which encourages me to succeed and grow ......",
                        hintStyle: TextStyle(color: Colors.black26,fontSize: 15),
                      )),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                leading: Icon(Icons.group, size: 30, color: Colors.lightBlue),
                title: Text("Reference", style: TextStyle(fontSize: 30,),),
                trailing: Text(""),
                children: [
                  Reference(labelname: "Referee's Name",data: ref_name),
                  Reference(labelname: "Job Title",data: ref_job),
                  Reference(labelname: "Company Name",data: ref_company),
                  Reference(labelname: "Email",data: ref_email),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ExpansionTile(
                  leading:
                  Icon(Icons.model_training_rounded, size: 30,
                      color: Colors.lightBlue),
                  title: Text(
                    "Traning",
                    style: TextStyle(fontSize: 30,),
                  ),
                  trailing:Text(""),
              ),
            ),
            Traning("Enter Traning Institute Name", user_traning),
            Traning("Enter Traning Year", user_traning_year),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ListTile(
                  leading:
                  Icon(Icons.workspace_premium_outlined, size: 30,
                      color: Colors.lightBlue),
                  title: Text(
                    "Project",
                    style: TextStyle(fontSize: 30,),
                  ),
                  trailing:
                  Switch(value: project, onChanged: (value) {
                    setState(() {
                      project = value;
                    });
                  }, activeColor: Colors.white,)
              ),
            ),
            Project("Enter Project Name",user_project),
            Project("Enter Project in Details",user_project_info),
            ElevatedButton(onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Information Added Successfully"),
                backgroundColor: Colors.green,));
            }, child: Text("Submit",style: TextStyle(fontSize: 20),)),

            SizedBox(height: 15),

            ElevatedButton(onPressed: () {

              setState(() {

                for (int i = 0; i < softselect.length; i++) {
                  if (softselect[i] == true) {
                    softskills = "$softskills  ${softSkill[i]}";
                  }
                }

                for (int i = 0; i < techselect.length; i++) {
                  if (techselect[i] == true) {
                    techskills = "$techskills  ${techSkill[i]}";
                  }
                }

                rm_new = ResumeModal(
                  user_name: user_name.text, user_address: user_address.text,
                  user_email: user_email.text, user_contact: user_contact.text,
                  user_project: user_project.text,user_project_details: user_project_info.text,
                  user_training_place: user_traning.text,user_training_year: user_traning_year.text,
                  user_education: eduSel,user_career: objective.text,
                  user_tech_skills: techskills, user_soft_skills: softskills,
                );

                Navigator.pushNamed(context, "preview" , arguments: rm_new);

              });


            }, child: Text("View Your Resume",style: TextStyle(fontSize: 20),)),



          ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> back() async {
    showExitDialog();
    return await false;
  }

  void showExitDialog()
  {
    showDialog(context: context,barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: Text("Are you wanted to Quit the Application"),
          content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               ElevatedButton(
                      onPressed: () {
                        SystemNavigator.pop();
                    //exit(0);
                  },
                  child: Text("Yes"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                  Navigator.pop(context);
                  },
                  child: Text("No"),
                  style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
                  ),
              ],
          ),
        );

     },);
  }


  Widget PersonalDetails({String? title, String? hintname, TextEditingController? data})
  {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Text("$title",style: TextStyle(fontSize: 25),),
          TextField(
              controller: data,
              textInputAction: TextInputAction.next,
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                        width: 2)),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12,
                        width: 2)),
                hintText: "$hintname",
                hintStyle: TextStyle(color: Colors.black26,fontSize: 20),
              )),
        ],
      ),
    );
  }

  Widget NationalityRadio(String country_name)
  {
    return RadioListTile(value: "$country_name", groupValue: country, onChanged: (value) {
      setState(() {
        country = value!;
        print(country);
      });},
      title: Text("$country_name",style: TextStyle(fontSize: 15)),);

  }

  Widget Exp_Type(String type_name)
  {
    return RadioListTile(value: "$type_name", groupValue: exp, onChanged: (value) {
      setState(() {
        exp = value!;
        print(exp);
      });},
      title: Text("$type_name",style: TextStyle(fontSize: 15)),);
  }

  Widget SoftCheck({String? soft_name, int? soft_index})
  {
    return CheckboxListTile(
      value: softselect[soft_index!],
      onChanged: (value) {
        setState(() {
          softselect[soft_index] = value;
        });
      },
      title: Text("$soft_name",
        style: TextStyle(fontSize: 20,),),
    );
  }
  Widget TechCheck({String? tech_name, int? tech_index})
  {
    return CheckboxListTile(
      value: techselect[tech_index!],
      onChanged: (value) {
        setState(() {
          techselect[tech_index] = value;
        });
      },
      title: Text("$tech_name",
        style: TextStyle(fontSize: 20,),),
    );
  }

  Widget Reference({ String? labelname, TextEditingController? data})
  {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: TextField(
          controller: data,
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                    width: 2)),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black12,
                    width: 2)),
            label: Text("$labelname"),
            labelStyle: TextStyle(color: Colors.lightBlueAccent.shade100,fontSize: 20),

          )),
    );
  }
  Widget Project(String hint,TextEditingController data)
  {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: Visibility(visible: project,
        child: TextField(
          controller: data,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                      width: 2)),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue,
                      width: 2)),
              hintText:
              "$hint",
            )),
      ),
    );
  }
  Widget Traning(String hint,TextEditingController data)
  {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: TextField(
          controller: data,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                    width: 2)),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.lightBlue,
                    width: 2)),
            hintText:
            "$hint",
          )),
    );
  }

}


/*






ExpansionTile()
    collapsedBackgroundColor: Colors.red.shade50,
    collapsedTextColor: Colors.redAccent,
    collapsedIconColor: Colors.redAccent,
    backgroundColor: Colors.orange.shade50,
    textColor: Colors.orange,
    iconColor: Colors.orange,
* */
