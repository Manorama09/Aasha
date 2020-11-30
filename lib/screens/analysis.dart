import 'package:aasha/widgets/chart1.dart';
import 'package:aasha/widgets/chart2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottomNavBar.dart';

class Analysis extends StatefulWidget {
  @override
  _AnalysisState createState() => _AnalysisState();
}

class _AnalysisState extends State<Analysis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavBar(),
       backgroundColor: const Color(0xffF4EEFF),
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(85, 0, 0, 0),
          child: Text("Analysis",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Chart1(),
          SizedBox(height:5),
          Chart2(),
          SizedBox(height:5),
          Chart1(),
          SizedBox(height:5),
          Chart1(),
        ],
        )
    );
  }
}