import 'package:flutter/material.dart';

class New_Resume extends StatefulWidget {
  const New_Resume({Key? key}) : super(key: key);

  @override
  State<New_Resume> createState() => _New_ResumeState();
}

class _New_ResumeState extends State<New_Resume> {

  Color whited = Colors.white;
  Color blacked = Colors.black;

  String country = "Indian";
  String? countrySel;

  List edu = ["B.E.","M.B.B.S","Ph.D","SSC","HSC","B.Sc"];
  String? eduSel;
  TextEditingController stream = TextEditingController();

  String exp = "Experience";
  String? expSel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
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

              children: [
                PersonalDetails(title: "Name", hintname: "Your Full Name"),
                PersonalDetails(title: "Address", hintname: "Main Road, Surat"),
                PersonalDetails(title: "Email", hintname: "myresume@gmail.com"),
                PersonalDetails(title: "Contact", hintname: "998877123"),
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
              trailing: Text("$eduSel in ${stream.text}"),
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
                    controller: stream,
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
              children: [
                Exp_Type("Fresher"),
                Exp_Type("Experiance")
              ],
            ),
          ),





        ],
      ),
    );
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