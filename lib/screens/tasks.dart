import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget task(String s) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
          elevation: 4.0,
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffB180FE).withOpacity(0.45)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 60),
                child: Text(s,
                    style: GoogleFonts.workSans(
                        color: const Color(0xff1E2558),
                        fontSize: 20,
                        fontWeight: FontWeight.w400)),
              ))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EEFF),
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Text("Tasks",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 45,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          task("#1 Waste Segregation"),
          task("#2 Waste Segregation"),
          task("#3 Waste Segregation"),
          task("#4 Waste Segregation"),
          task("#5 Waste Segregation"),
          task("#6 Waste Segregation"),
          task("#7 Waste Segregation"),
          task("#8 Waste Segregation"),
          task("#9 Waste Segregation"),
          task("#10 Waste Segregation"),
        ],
      ),
    );
  }
}
