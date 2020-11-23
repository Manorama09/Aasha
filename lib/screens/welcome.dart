import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}
class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF4EEFF),
        body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 80.0),
                  child: Image.asset('./images/logo.png'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                Text("Aasha",
                    style: GoogleFonts.dancingScript(
                        color: const Color(0xff1E2558),
                        fontSize: 88,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 75,
                ),
                Text("With hope, we can.",
                    style: GoogleFonts.workSans(
                        color: const Color(0xff1E2558),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                FlatButton(
                    color: const Color(0xffA3D4FF),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 11),
                      child: Text("Sign Up!",
                          style: GoogleFonts.workSans(
                              color: const Color(0xff1E2558),
                              fontSize: 20,
                              fontWeight: FontWeight.w500)),
                    )),
              ]),
        ));
  }
}
