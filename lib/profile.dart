import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List edu = ["B.E.", "M.B.B.S", "Ph.D", "SSC", "HSC", "B.Sc"];
  List techSkill = [
    "Basic Programming",
    "Web Designing",
    "Network Security",
    "Mobile Developing",
    "Database"
  ];
  List techselect = [false, false, false, false, false];
  bool project = false;
  bool mode = false;
  String? eduSel;

  bool demo = false;
  Color light = Colors.brown.shade500;
  Color dark = Colors.black;
  Color c1=Colors.black;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: c1,
        appBar: AppBar(
          backgroundColor: c1,
          leading: Switch(value: mode, onChanged: (value) {
            setState(() {
              mode = value;
              if( mode == false )
              {
                c1 = light;
              }
              else
              {
                c1 = dark;
              }

            });
          }, activeColor: Colors.white,),

          title: Text(
            "Profile",
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          centerTitle: true,
          elevation: 0,
          actions: [
            PopupMenuButton(
              itemBuilder: (context) =>
              [
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
                  Padding(
                    padding: EdgeInsets.only(left: 8, right: 8.0, top: 15),
                    child: TextField(textInputAction: TextInputAction.next,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          label: Text(
                            "Enter Full Name",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
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
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          label: Text(
                            "Enter Email ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 20),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white,
                                  width: 2)),
                          label: Text(
                            "Enter Contact ",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  ),
                ],
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
                  items: edu.map((e) =>
                      DropdownMenuItem(child: Text("$e", style: TextStyle(
                          color: Colors.white, fontSize: 20)), value: e,))
                      .toList(),
                  value: eduSel,
                  //alignment: Alignment.center,
                  onChanged: (value) {
                    setState(() {
                      eduSel = value as String;
                      print(eduSel);
                    });
                  },
                  hint: Text("  *   *   *   Enter Education  *   *   *   ",
                    style: TextStyle(fontSize: 20, color: Colors.white),),
                ),
              ),
              SizedBox(height: 20),
              ExpansionTile(
                leading:
                Icon(Icons.event_available, size: 30, color: Colors.white),
                title: Text(
                  "Technical Skills",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                trailing:
                InkWell(
                  onTap: () {
                    setState(() {
                      if(demo==false)
                        {
                          demo=true;
                        }
                      else
                        {
                          demo=false;
                        }
                    });
                  },
                  child: demo==false?Icon(
                    Icons.arrow_drop_down,
                    size: 30,
                    color: Colors.white,
                  ):Icon(
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
                       CheckboxListTile(value: techselect[0],
                         onChanged: (value) {
                           setState(() {
                             techselect[0] = value;
                           });
                         },
                         checkColor: Colors.white,
                         activeColor: Colors.white,
                         title: Text("${techSkill[0]}",
                           style: TextStyle(fontSize: 20, color: Colors.white),),),
                       CheckboxListTile(value: techselect[1],
                         onChanged: (value) {
                           setState(() {
                             techselect[1] = value;
                           });
                         },
                         checkColor: Colors.black,
                         activeColor: Colors.white,
                         title: Text("${techSkill[1]}",
                           style: TextStyle(fontSize: 20, color: Colors.white),),),
                       CheckboxListTile(value: techselect[2],
                         onChanged: (value) {
                           setState(() {
                             techselect[2] = value;
                           });
                         },
                         checkColor: Colors.black,
                         activeColor: Colors.white,
                         title: Text("${techSkill[2]}",
                           style: TextStyle(fontSize: 20, color: Colors.white),),),
                       CheckboxListTile(value: techselect[3],
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
                         title: Text("${techSkill[3]}",
                           style: TextStyle(fontSize: 20, color: Colors.white),),),
                       CheckboxListTile(value: techselect[4],
                         onChanged: (value) {
                           setState(() {
                             techselect[4] = value;
                           });
                         },
                         checkColor: Colors.black,
                         activeColor: Colors.white,
                         title: Text("${techSkill[4]}",
                           style: TextStyle(fontSize: 20, color: Colors.white),),),
                     ],
                   ),
                 )
                ],
              ),

              SizedBox(height: 20),
              ListTile(
                  leading:
                  Icon(Icons.workspace_premium_outlined, size: 30,
                      color: Colors.white),
                  title: Text(
                    "Project",
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  trailing:
                  Switch(value: project, onChanged: (value) {
                    setState(() {
                      project = value;
                    });
                  }, activeColor: Colors.white,)
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Visibility(visible: project,
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,
                                width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,
                                width: 2)),
                        hintText:
                        "Enter Project Name",
                        hintStyle: TextStyle(color: Colors.white),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(visible: project,
                  child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,
                                width: 2)),
                        border: OutlineInputBorder(),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white,
                                width: 2)),
                        hintText:
                        "Enter Project in Details",
                        hintStyle: TextStyle(color: Colors.white),
                      )),
                ),
              ),

              SizedBox(height: 20),

              ExpansionTile(
                leading:
                Icon(Icons.event_available, size: 30, color: Colors.white),
                title: Text(
                  "Soft Skills",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),

                children: [
                  CheckboxListTile(value: techselect[0],
                    onChanged: (value) {
                      setState(() {
                        techselect[0] = value;
                      });
                    },
                    side: MaterialStateBorderSide.resolveWith((states) {
                      return BorderSide(color: Colors.white);
                    }),
                    activeColor: Colors.blueGrey,
                    checkColor: Colors.white,
                    title: Text("Public Speaking",
                      style: TextStyle(fontSize: 20, color: Colors.white),),),
                  CheckboxListTile(value: techselect[1],
                    onChanged: (value) {
                      setState(() {
                        techselect[1] = value;
                      });
                    },
                    side: MaterialStateBorderSide.resolveWith((states) {
                      return BorderSide(color: Colors.white);
                    }),
                    activeColor: Colors.blueGrey,
                    checkColor: Colors.white,
                    title: Text("Time management",
                      style: TextStyle(fontSize: 20, color: Colors.white),),),
                  CheckboxListTile(value: techselect[2],
                    onChanged: (value) {
                      setState(() {
                        techselect[2] = value;
                      });
                    },
                    side: MaterialStateBorderSide.resolveWith((states) {
                      return BorderSide(color: Colors.white);
                    }),
                    activeColor: Colors.blueGrey,
                    checkColor: Colors.white,
                    title: Text("Critical thinking",
                      style: TextStyle(fontSize: 20, color: Colors.white),),),
                  CheckboxListTile(value: techselect[3],
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
                    title: Text("Leadership",
                      style: TextStyle(fontSize: 20, color: Colors.white),),),
                ],
              ),
              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return AlertDialog(title: Text("Are you wanted to Quit the Application"),
                      content: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                        ElevatedButton(onPressed: () {setState(() {
                          Navigator.pushNamed(context, "/");
                        });},
                          child: Text("Yes"), style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),),
                        ElevatedButton(onPressed: () {setState(() {
                          //Navigator.pushNamed(context, "profile");
                        });},
                          child: Text("No"), style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.redAccent),),
                      ],),);
                  },);

                },
                child: Text("Submit",
                    style: TextStyle(fontSize: 20, color: Colors.blueGrey)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,),)

            ],
          ),
        ),
      ),
    );
  }
}
