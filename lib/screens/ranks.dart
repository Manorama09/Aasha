import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class RanksScreen extends StatelessWidget {
 Widget task(String s, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width/1,
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      child: Card(
          elevation: 4.0,
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
          child: Text("Ranks",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 45,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          task("#1 Manorama Maharana",context),
          task("#2 Kartavya Asthana",context),
          task("#3 Riddhi Gupta",context),
          task("#4 Saloni Parekh",context),
          task("#5 Sanchi Chopra",context),
        ],
      ),
    );
  }
}
