import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                Navigator.pushNamed(context, "new_resume");
              });
            },
            child: Container(
              height: 75,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.teal.shade400),
              child: Text("Welcome",style: TextStyle(fontSize: 20,color: Colors.white),),
            ),
          ),
        ),
      ),
    );
  }
}
