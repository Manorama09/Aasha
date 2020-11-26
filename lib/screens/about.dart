import 'package:aasha/widgets/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EEFF),
      appBar: new AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Text("About",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Our Motive",
                style: GoogleFonts.dancingScript(
                    color: const Color(0xff1E2558),
                    fontSize: 40,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
            Text("Terms & Conditions",
                style: GoogleFonts.dancingScript(
                    color: const Color(0xff1E2558),
                    fontSize: 40,
                    fontWeight: FontWeight.w700)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 10,
            ),
          ],
        ),
      ),
      //bottomNavigationBar: BottomNavBar(),
    );
  }
}
