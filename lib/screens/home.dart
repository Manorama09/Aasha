import 'package:aasha/screens/about.dart';
import 'package:aasha/screens/analysis.dart';
import 'package:aasha/widgets/chart1.dart';
import 'package:aasha/screens/ranks.dart';
import 'package:aasha/screens/news.dart';
import 'package:aasha/screens/settings.dart';
import 'package:aasha/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'welcome.dart';
import 'sign_in.dart';

class HomeScreen extends StatelessWidget {
  Widget button(String s, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 45.0, vertical: 80),
        child: Text(s,
            style: GoogleFonts.dancingScript(
                color: Colors.white,
                fontSize: 45,
                fontWeight: FontWeight.w700)),
      ),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: const Color(0xffAF80FE), shape: BoxShape.rectangle),
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
            padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
            child: Row(children: <Widget>[
              Container(
                width: 36,
                height: 36,
                child: Image.asset('./images/logo.png'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10,0,0,0),
                child: Text("Aasha",
                    style: GoogleFonts.dancingScript(
                        color: const Color(0xff1E2558),
                        fontSize: 35,
                        fontWeight: FontWeight.w700)),
              ),
            ]),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TasksScreen()),
                          );
                        },
                        child: button("Tasks", context),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RanksScreen()),
                          );
                        },
                        child: button("Rank", context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => NewsScreen()),
                          );
                        },
                        child: button("News", context),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()),
                          );
                        },
                        child: button("About", context),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Row(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Analysis()),
                          );
                        },
                        child: button("Chart", context),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()),
                          );
                        },
                        child: button("Settings", context),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
