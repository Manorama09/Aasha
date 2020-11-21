import 'package:aasha/screens/about.dart';
import 'package:aasha/screens/ranks.dart';
import 'package:aasha/screens/news.dart';
import 'package:aasha/screens/tasks.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  Widget button(String s) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(45.0),
        child: Text(s,
            style: GoogleFonts.dancingScript(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.w700)),
      ),
      margin: EdgeInsets.all(10.0),
      decoration:
          BoxDecoration(color: const Color(0xffAF80FE), shape: BoxShape.circle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4EEFF),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Heading",
                    style: GoogleFonts.dancingScript(
                        color: const Color(0xff1E2558),
                        fontSize: 80,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        child: button("Tasks"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RanksScreen()),
                          );
                        },
                        child: button("Ranks"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
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
                        child: button("News"),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AboutScreen()),
                          );
                        },
                        child: button("About"),
                      ),
                    ],
                  ),
                ),
              ]),
        ));
  }
}
