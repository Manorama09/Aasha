import 'package:aasha/screens/first.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'sign_in.dart';
import 'home.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: () {
        signInWithGoogle().then((result) {
          if (result != null) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return HomeScreen();
                },
              ),
            );
          }
        });
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey[500]),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('./images/google.png', height: 25),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text('Sign in with Google',
                  style: GoogleFonts.workSans(
                      color: Colors.grey[700],
                      fontSize: 18,
                      fontWeight: FontWeight.w400)),
            )
          ],
        ),
      ),
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
                Text("Join the green side.",
                    style: GoogleFonts.workSans(
                        color: const Color(0xff1E2558),
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: _signInButton(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:70, vertical:8.0),
                  child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: const Color(0xff4DA6E9),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      },
                      child: Row(children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 7),
                            child:
                                Image.asset('./images/twitter.png', height: 35),
                          ),
                          Text("Sign in with Twitter",
                              style: GoogleFonts.workSans(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400)),
                        ]),
                      )),
              ]),
        ));
  }
}
