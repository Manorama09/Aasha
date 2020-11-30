import 'package:aasha/screens/about.dart';
import 'package:aasha/screens/analysis.dart';
import 'package:aasha/screens/ranks.dart';
import 'package:aasha/screens/news.dart';
import 'package:aasha/screens/settings.dart';
import 'package:aasha/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  Widget button(String s, BuildContext context, Icon icon) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0,60,30,40),
        child: Column(children: <Widget>[
          icon,
          SizedBox(height:10),
          Text(s,
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ]),
      ),
      margin: EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: const Color(0xff8765BF), 
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)
          ),
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
                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        child: button(
                            "E- Challenges",
                            context,
                            Icon(
                              Icons.note,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RanksScreen()),
                          );
                        },
                        child: button(
                            "Rewards",
                            context,
                            Icon(
                              Icons.card_giftcard,
                              size: 60,
                              color: Colors.white,
                            )),
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
                        child: button(
                            "Awareness",
                            context,
                            Icon(
                              Icons.info,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()),
                          );
                        },
                        child: button(
                            "About",
                            context,
                            Icon(
                              Icons.people,
                              size: 60,
                              color: Colors.white,
                            )),
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
                            MaterialPageRoute(builder: (context) => Analysis()),
                          );
                        },
                        child: button(
                            "Analysis",
                            context,
                            Icon(
                              Icons.bar_chart,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingsScreen()),
                          );
                        },
                        child: button(
                            "Settings",
                            context,
                            Icon(
                              Icons.settings,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
