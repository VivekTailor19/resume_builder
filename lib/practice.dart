// import 'package:flutter/material.dart';
//
// class Practice extends StatefulWidget {
//   const Practice({Key? key}) : super(key: key);
//
//   @override
//   State<Practice> createState() => _PracticeState();
// }
//
// class _PracticeState extends State<Practice> {
//
//   TextEditingController u_sc = TextEditingController();
//   TextEditingController u_col =  TextEditingController();
//   TextEditingController u_mas = TextEditingController();
//
//   int no = 0;
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Container(color: Colors.lightBlueAccent.shade100,
//                 child: Column(
//                   children: [
//                     Text("$no",style: TextStyle(fontSize: 25),),
//                     SizedBox(height: 15),
//                     Edu_Detail(title: "School / Collage", hintname: "Enter Board / University Name",data: u_sc),
//                     Edu_Detail(title: "Degree", hintname: "Degree / Qualification Name",data: u_col),
//                     Edu_Detail(title: "Percentage", hintname: "Out of 100",data: u_mas),
//                     SizedBox(height: 10),
//                       ],
//                     ),
//               ),),
//             ElevatedButton(onPressed: () {
//               setState(() {
//                 no++;
//               });
//
//
//
//             }, child: Text("++ Add ++"))
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget Edu_Detail({String? title, String? hintname, TextEditingController? data,})
//   {
//     return Padding(
//       padding: EdgeInsets.only(top: 5),
//       child: Column(
//         //mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children : [
//           Text("$title",style: TextStyle(fontSize: 22),),
//           TextFormField(
//               controller: data,
//               textInputAction: TextInputAction.next,
//               style: TextStyle(color: Colors.black),
//               decoration: InputDecoration(
//                 focusedBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.lightBlueAccent.shade100,
//                         width: 2)),
//                 border: OutlineInputBorder(),
//                 enabledBorder: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.black12,
//                         width: 2)),
//                 hintText: "$hintname",
//                 hintStyle: TextStyle(color: Colors.black26,fontSize: 20),
//               ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class MyTabbedPage extends StatefulWidget {
  const MyTabbedPage({Key? key}) : super(key: key);
  @override
  _MyTabbedPageState createState() => new _MyTabbedPageState();
}

class _MyTabbedPageState extends State<MyTabbedPage>{


  int i = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              setState(() {
                i++;
                print(i);
                print("Fidase");
              });
            },
            child: Text('TextButton'),
          ),
          Column(
            children: [

            ],
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: i,
            itemBuilder: (BuildContext ctxt, int index) {
              return Container(
                margin: EdgeInsets.all(10),
                color: Colors.blueGrey,
                height: 50,
                width: 50,
                child: Text("Container numero $i"),
              );
            },
          ),
        ],
      ),
    );
  }
}