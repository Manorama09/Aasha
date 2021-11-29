import './report.dart';
import './analysis.dart';
import './tasks.dart';
import './ranks.dart';
import './news.dart';
import './settings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../icons/custom_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Widget button(String s, BuildContext context, Icon icon) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.1,
      height: MediaQuery.of(context).size.height / 3.75,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 60, 30, 40),
        child: Column(children: <Widget>[
          icon,
          SizedBox(height: MediaQuery.of(context).size.height / 60),
          Text(s,
              style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500)),
        ]),
      ),
      margin: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
          color: const Color(0xff8765BF),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4EEFF),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(65, 0, 0, 0),
            child: Row(children: <Widget>[
              SizedBox(
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
                                builder: (context) => const TasksScreen()),
                          );
                        },
                        child: button(
                            "E- Challenges",
                            context,
                            const Icon(
                              CustomIcon.archery_target,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RanksScreen()),
                          );
                        },
                        child: button(
                            "Leaderboard",
                            context,
                            const Icon(
                              CustomIcon.award,
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
                                builder: (context) => const NewsScreen()),
                          );
                        },
                        child: button(
                            "Awareness",
                            context,
                            const Icon(
                              CustomIcon.newspaper,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReportScreen()),
                          );
                        },
                        child: button(
                            "Report",
                            context,
                            const Icon(
                              Icons.warning,
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
                            MaterialPageRoute(builder: (context) => const Analysis()),
                          );
                        },
                        child: button(
                            "Analysis",
                            context,
                            const Icon(
                              CustomIcon.chart_bar,
                              size: 60,
                              color: Colors.white,
                            )),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SettingsScreen()),
                          );
                        },
                        child: button(
                            "Settings",
                            context,
                            const Icon(
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
