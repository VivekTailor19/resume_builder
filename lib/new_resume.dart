

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import 'resumeDataModal.dart';

class New_Resume extends StatefulWidget {
  const New_Resume({Key? key}) : super(key: key);

  @override
  State<New_Resume> createState() => _New_ResumeState();
}

var txtkey = GlobalKey<FormState>();


class _New_ResumeState extends State<New_Resume> {

  TextEditingController u_name = TextEditingController();
  TextEditingController u_address = TextEditingController();
  TextEditingController u_email = TextEditingController();
  TextEditingController u_contact = TextEditingController();

  TextEditingController u_project = TextEditingController();
  TextEditingController u_project_info = TextEditingController();

  TextEditingController u_training= TextEditingController();
  TextEditingController u_training_year= TextEditingController();

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
  String education = "";

  String exp = "Experience";
  String? expSel;

  List softSkill = ["Public Speaking","LeaderShip","Time Management","Critical Thinking","Positive attitude"];
  List softselect = [false, false, false, false, false];

  List techSkill = ["Basic Programming","Web Designing","Network Security","Mobile Developing","Database"];
  List techselect = [false, false, false, false, false];

  TextEditingController objective = TextEditingController();

  bool project = false;

  ResumeModal rm_new = ResumeModal();

  int submit = 0;
  String path = "" ;
  RangeValues rangevalues = RangeValues(10000, 250000);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: txtkey,
      child: WillPopScope(
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
                      maintainState: true,
                      leading: Icon(Icons.person_outline, size: 30, color: Colors.lightBlue),
                      title: Text("Personal Information", style: TextStyle(fontSize: 30,),),
                      trailing: Text(""),

                      children: [

                        Row(
                          children: [

                            path==null ? CircleAvatar(radius: 60,backgroundImage: AssetImage("assets/images/anonymous.jpg")) : CircleAvatar(radius: 80,backgroundImage: FileImage(File("$path")),),
                            Container(
                              height: 60,
                              child: Padding(
                                padding: EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(onTap: () async {
                                      ImagePicker pic = ImagePicker();
                                      XFile? xfile = await pic.pickImage(source: ImageSource.camera);

                                      setState(() {
                                        path = xfile!.path;
                                      });
                                    },
                                        child: Row(children: [Icon(Icons.camera_alt_outlined,size: 25),SizedBox(width: 10),Text("Capture"),] )),
                                    InkWell(
                                        onTap: () async {
                                      ImagePicker pic = ImagePicker();
                                      XFile? xfile = await pic.pickImage(source: ImageSource.gallery);

                                      setState(() {
                                        path = xfile!.path;
                                      });
                                    },
                                        child: Row(children: [Icon(Icons.file_upload_outlined,size: 25),SizedBox(width: 10),Text("Upload Image"),] )),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),

                        PersonalDetails(title: "Name", hintname: "Your Full Name",data: u_name,validation: "Name",kboard: TextInputType.name),
                        PersonalDetails(title: "Address", hintname: "Main Road, Surat",data: u_address,kboard: TextInputType.streetAddress),
                        PersonalDetails(title: "Email", hintname: "myresume@gmail.com",data: u_email,validation:"Email",kboard: TextInputType.emailAddress),
                        PersonalDetails(title: "Contact", hintname: "998877123",data: u_contact,validation:"Contact",kboard: TextInputType.phone),
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
                              DropdownMenuItem(child: Text("$e", style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
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
                        TextFormField(validator: (value) {
                          if(value!.isEmpty)
                            {
                              return "Enter Stream in the $eduSel";
                            }
                        },
                            onChanged: (value) {
                              setState(() {
                                stream = value;
                                education = "$eduSel in $stream";
                              });
                            },

                            keyboardType: TextInputType.text,
                          //controller: stream,
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
                        Reference(labelname: "Referee's Name",data: ref_name,kboard: TextInputType.name),
                        Reference(labelname: "Job Title",data: ref_job,kboard: TextInputType.text),
                        Reference(labelname: "Company Name",data: ref_company,kboard: TextInputType.text),
                        Reference(labelname: "Email",data: ref_email,kboard: TextInputType.emailAddress),
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
                        "Training",
                        style: TextStyle(fontSize: 30,),
                      ),
                      trailing:Text(""),
                    ),
                  ),
                  Training(hint: "Enter Training Institute Name",data: u_training,kboard: TextInputType.text),
                  Training(hint: "Enter Training Year",data: u_training_year,kboard: TextInputType.number),

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
                  Project(hint: "Enter Project Name",data: u_project),
                  Project(hint: "Enter Project in Details",data: u_project_info),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: ExpansionTile(
                      leading: Icon(Icons.date_range, size: 30, color: Colors.lightBlue),
                      title: Text("Expected Salary", style: TextStyle(fontSize: 30,),),
                      trailing: Text(""),
                      children: [
                        RangeSlider(values: rangevalues,labels: RangeLabels("${rangevalues.start.round()}","${rangevalues.end.round()}"), onChanged: (value) {
                          setState(() {
                            rangevalues = value;
                          });

                        },max: 300000,divisions: 25,)
                      ],
                    ),
                  ),

                  ElevatedButton(onPressed: () {
                    var softskills = "";
                    var techskills = "";
                    List skill  = [];

                    submit = 1;
                    if(txtkey.currentState!.validate()){

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Your Information Added Successfully"),
                        backgroundColor: Colors.green,));
                      setState(() {

                        for (int i = 0; i < softselect.length; i++) {
                          if (softselect[i] == true) {
                            softskills = "$softskills  ${softSkill[i]}";
                            skill.add(softSkill[i]);
                          }
                        }


                        for (int i = 0; i < techselect.length; i++) {
                          if (techselect[i] == true) {
                            techskills = "$techskills  ${techSkill[i]}";
                          }
                        }
                        rm_new = ResumeModal(
                          u_name: u_name.text, u_address: u_address.text,
                          u_email: u_email.text, u_contact: u_contact.text,
                          u_project: u_project.text,u_project_details: u_project_info.text,
                          u_training_place: u_training.text,u_training_year: u_training_year.text,
                          u_education: education,u_career: objective.text,
                          u_tech_skills: techskills, u_soft_skills: softskills,
                          u_ref: ref_name.text,u_refjob: ref_job.text,u_refcompany: ref_company.text,
                            u_refemail: ref_email.text, u_path: path,u_skill: skill,rangevalue: rangevalues
                        );

                      });
                      // txtkey.currentState?.reset();
                      print(skill);

                    }

                  }, child: Text("Submit",style: TextStyle(fontSize: 20),)),


                  SizedBox(height: 15),

                  Visibility(visible: (submit == 1) ? true : false,
                    child: ElevatedButton(onPressed: () {
                      Navigator.pushNamed(context, "preview" , arguments: rm_new);

                    }, child: Text("View Your Resume",style: TextStyle(fontSize: 20),)),
                  ),

                  SizedBox(height: 25),

                ],
              ),
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

  Widget PersonalDetails({String? title, String? hintname, TextEditingController? data,String? validation,TextInputType? kboard })
  {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Column(
        //mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children : [
          Text("$title",style: TextStyle(fontSize: 22),),
          TextFormField(
              controller: data,
              validator: (value) {
                if(validation == "Name")
                {
                  if(value!.isEmpty)
                  {
                    return "Please Fill this Details";
                  }
                }
                else if(validation == "Email")
                {
                  if(value!.isEmpty)
                  {
                    return "Please Enter Email Address";
                  }
                  else
                  {
                    int count = 0;
                    for(int i = 0 ; i<value.length ; i++)
                    {
                      if(value[i] == "@")
                      {
                        count++;
                      }
                    }
                    if(count == 0)
                    {
                      return "Enter Proper Email Address";
                    }
                  }

                }
                else if(validation == "Contact")
                {
                  if(value!.isEmpty)
                  {
                    return "Please Enter Contact Number";
                  }
                  else if(value.length != 10)
                  {
                    return "Enter 10 digit Contact Number";
                  }
                }
                return null;

              },
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
              ),
              keyboardType: kboard),

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
      title: Text("$country_name",style: TextStyle(fontSize: 13)),);

  }
  Widget Exp_Type(String type_name)
  {
    return RadioListTile(value: "$type_name", groupValue: exp, onChanged: (value) {
      setState(() {
        exp = value!;
        print(exp);
      });},
      title: Text("$type_name",style: TextStyle(fontSize: 13)),);
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
        style: TextStyle(fontSize: 18,),),
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
        style: TextStyle(fontSize: 18,),),
    );
  }
  Widget Reference({ String? labelname, TextEditingController? data,TextInputType? kboard})
  {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: TextFormField(
          controller: data,
          textInputAction: TextInputAction.next,
          keyboardType: kboard,
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
            labelStyle: TextStyle(color: Colors.lightBlueAccent.shade100,fontSize: 13),

          )),
    );
  }
  Widget Project({String? hint, TextEditingController? data})
  {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: Visibility(visible: project,
        child: TextFormField(
            controller: data,
            style: TextStyle(color: Colors.black),
            keyboardType:TextInputType.text,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
                      width: 2)),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlue,
                      width: 2)),
              hintText: "$hint",
            )),
      ),
    );
  }
  Widget Training({String? hint, TextEditingController? data, TextInputType? kboard})
  {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: TextFormField(
          controller: data,
          style: TextStyle(color: Colors.black),
          keyboardType: kboard,
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
