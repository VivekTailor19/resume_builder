import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:resume_builder/resumeDataModal.dart';

class Old_Resume extends StatefulWidget {
  const Old_Resume({Key? key}) : super(key: key);

  @override
  State<Old_Resume> createState() => _Old_ResumeState();
}

class _Old_ResumeState extends State<Old_Resume> {


  TextEditingController u_name = TextEditingController();
  TextEditingController u_address = TextEditingController();
  TextEditingController u_email = TextEditingController();
  TextEditingController u_contact = TextEditingController();
  TextEditingController u_country = TextEditingController();
  TextEditingController u_project = TextEditingController();
  TextEditingController u_project_info = TextEditingController();

  List edu = ["B.E.", "M.B.B.S", "Ph.D", "SSC", "HSC", "B.Sc"];
  String? eduSel;

  List techSkill = [
    "Basic Programming",
    "Web Designing",
    "Network Security",
    "Mobile Developing",
    "Database"
  ];
  List techselect = [false, false, false, false, false];
  var techskills = "";

  List softSkill = [
    "Public Speaking",
    "LeaderShip",
    "Time Management",
    "Critical Thinking",
    "Positive attitude"
  ];
  List softselect = [false, false, false, false, false];
  var softskills = "";
  bool project = false;

  bool demo = false;

  bool mode = false;
  Color light = Colors.brown.shade500;
  Color dark = Colors.black;
  Color c1 = Colors.brown.shade500;

  RangeValues rangeValues = RangeValues(25000, 250000);

  String country = "Indian";
  String? countrySel;

  ResumeModal rm_old = ResumeModal();



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: back,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: c1,
          appBar: AppBar(
            backgroundColor: c1,
            leading: Switch(
              value: mode,
              onChanged: (value) {
                setState(() {
                  mode = value;
                  if (mode == false) {
                    c1 = light;
                  } else {
                    c1 = dark;
                  }
                });
              },
              activeColor: Colors.white,
            ),
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
                ExpansionTile(
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
                  children: [
                    Personal("Enter Full Name", u_name),
                    Personal("Enter Address", u_address),
                    Personal("Enter Email Id", u_email),
                    Personal("Enter Contact No", u_contact),
                    Padding(
                      padding: EdgeInsets.only(left: 8, right: 8.0, top: 15),
                      child: Container(
                        color: Colors.white,
                        child: ExpansionTile(
                          collapsedBackgroundColor: Colors.red.shade50,
                          collapsedTextColor: Colors.redAccent,
                          collapsedIconColor: Colors.redAccent,
                          backgroundColor: Colors.orange.shade50,
                          textColor: Colors.orange,
                          iconColor: Colors.orange,
                          leading: Icon(
                            Icons.location_history,
                            size: 25,
                          ),
                          title: Text("Nationality",
                              style: TextStyle(
                                fontSize: 25,
                              )),
                          children: [
                            NationalityRadio("Indian"),
                            NationalityRadio("American"),
                            NationalityRadio("Chinese"),
                            NationalityRadio("Swiss"),
                            NationalityRadio("Japanese"),
                            NationalityRadio("Korean"),
                            NationalityRadio("English"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ListTile(
                  leading: Icon(Icons.school_outlined,
                      size: 30, color: Colors.white),
                  title: Text("Education",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  trailing: Icon(
                    Icons.edit,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: DropdownButton(
                    dropdownColor: Colors.black,
                    isExpanded: true,
                    items: edu
                        .map((e) => DropdownMenuItem(
                      child: Text("$e",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      value: e,
                      alignment: Alignment.center,
                    ))
                        .toList(),
                    value: eduSel,
                    //alignment: Alignment.center,
                    onChanged: (value) {
                      setState(() {
                        eduSel = value as String;
                        print(eduSel);
                      });
                    },
                    hint: Text(
                      "  *   *   *   Enter Education  *   *   *   ",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ExpansionTile(
                  leading: Icon(Icons.event_available,
                      size: 30, color: Colors.white),
                  title: Text(
                    "Technical Skills",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  trailing: InkWell(
                    onTap: () {
                      setState(() {
                        if (demo == false) {
                          demo = true;
                        } else {
                          demo = false;
                        }
                      });
                    },
                    child: demo == false
                        ? Icon(
                      Icons.arrow_drop_down,
                      size: 30,
                      color: Colors.white,
                    )
                        : Icon(
                      Icons.arrow_drop_up,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  children: [
                    Visibility(
                      visible: demo,
                      child: Column(
                        children: [
                          CheckboxListTile(
                            value: techselect[0],
                            onChanged: (value) {
                              setState(() {
                                techselect[0] = value;
                              });
                            },
                            checkColor: Colors.white,
                            activeColor: Colors.white,
                            title: Text(
                              "${techSkill[0]}",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          CheckboxListTile(
                            value: techselect[1],
                            onChanged: (value) {
                              setState(() {
                                techselect[1] = value;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            title: Text(
                              "${techSkill[1]}",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          CheckboxListTile(
                            value: techselect[2],
                            onChanged: (value) {
                              setState(() {
                                techselect[2] = value;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            title: Text(
                              "${techSkill[2]}",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          CheckboxListTile(
                            value: techselect[3],
                            onChanged: (value) {
                              setState(() {
                                techselect[3] = value;
                              });
                            },
                            side: MaterialStateBorderSide.resolveWith((states) {
                              return BorderSide(color: Colors.white);
                            }),
                            activeColor: Colors.blueGrey,
                            checkColor: Colors.white,
                            title: Text(
                              "${techSkill[3]}",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          CheckboxListTile(
                            value: techselect[4],
                            onChanged: (value) {
                              setState(() {
                                techselect[4] = value;
                              });
                            },
                            checkColor: Colors.black,
                            activeColor: Colors.white,
                            title: Text(
                              "${techSkill[4]}",
                              style:
                              TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                ListTile(
                    leading: Icon(Icons.workspace_premium_outlined,
                        size: 30, color: Colors.white),
                    title: Text(
                      "Project",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    trailing: Switch(
                      value: project,
                      onChanged: (value) {
                        setState(() {
                          project = value;
                        });
                      },
                      activeColor: Colors.white,
                    )),
                Project("Enter Project Name", u_project),
                Project("Enter Project in Details", u_project_info),
                SizedBox(height: 10),
                ExpansionTile(
                  leading: Icon(Icons.event_available,
                      size: 30, color: Colors.white),
                  title: Text(
                    "Soft Skills",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),

                  children: softSkill
                      .asMap()
                      .entries
                      .map((e) =>
                      SoftCheck(soft_name: softSkill[e.key], index: e.key))
                      .toList(),

                  // [SoftCheck("Public Speaking"),SoftCheck("Time Management"), SoftCheck("Critical Thinking"),SoftCheck("Leadership"), SoftCheck("PowerFull")],
                ),
                SizedBox(height: 10),
                ExpansionTile(
                  leading: Text("₹",
                      style: TextStyle(fontSize: 30, color: Colors.white)),
                  title: Text(
                    "Expected Salary",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  children: [
                    RangeSlider(
                      values: rangeValues,
                      onChanged: (value) {
                        setState(() {
                          rangeValues = value;
                        });
                      },
                      min: 10000,
                      max: 300000,
                      divisions: 29,
                      labels: RangeLabels("${rangeValues.start.round()}",
                          "${rangeValues.end.round()}"),
                      activeColor: Colors.white,
                      //inactiveColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    showExitDialog();
                  },
                  child: Text("Submit",
                      style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      rm_old = ResumeModal(
                          u_name: u_name.text,
                          u_address: u_address.text,
                          u_contact: u_contact.text,
                          u_email: u_email.text,
                          u_education: eduSel,
                          u_tech_skills: techskills,
                          u_soft_skills: softskills,
                          u_project: u_project.text,
                          u_project_details: u_project_info.text);
                      Navigator.pushNamed(context, "preview", arguments: rm_old);
                    },
                    child: Text(
                      "View Your Resume",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget Personal(String labelname, TextEditingController data) {
    return Padding(
      padding: EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: TextField(
        controller: data,
        textInputAction: TextInputAction.next,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2)),
            label: Text(
              "$labelname",
              style: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Widget Project(String hint, TextEditingController data) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8.0, top: 15),
      child: Visibility(
        visible: project,
        child: TextField(
            controller: data,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              border: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2)),
              hintText: "$hint",
              hintStyle: TextStyle(color: Colors.white),
            )),
      ),
    );
  }

  Widget NationalityRadio(String country_name) {
    return RadioListTile(
        value: "$country_name",
        groupValue: country,
        onChanged: (value) {
          setState(() {
            country = value!;
            u_country.text = country;
            print(country);
            print("u_country.text == ${u_country.text}");
          });
        },

        title: Text(
          "$country_name",
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        activeColor: Colors.green);
  }

  Widget SoftCheck({String? soft_name, int? index}) {
    return CheckboxListTile(
      value: softselect[index!],
      onChanged: (value) {
        setState(() {
          softselect[index] = value;
        });
      },
      side: MaterialStateBorderSide.resolveWith((states) {
        return BorderSide(color: Colors.white);
      }),
      activeColor: Colors.brown.shade500,
      checkColor: Colors.white,
      title: Text(
        "$soft_name",
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  void showExitDialog() {
    showDialog(
      barrierDismissible: false,
      context: context,
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
              ElevatedButton(
                onPressed: () {
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
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                              "Name = ${u_name.text} Address = ${u_address.text}"),
                          Text(
                              "Contact = ${u_contact.text} Email = ${u_email.text}"),
                          Text(" Nationality = $country"),
                          Text("Education = $eduSel"),
                          Text("Soft Skills = $softskills")
                        ],
                      )));
                },
                child: Text(
                  "SnackBar View",
                  style: TextStyle(fontSize: 15),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<bool> back() async {
    showExitDialog();
    return await false;
  }
}

// SnackBar WillPOPScope
