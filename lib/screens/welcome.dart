import 'dart:async';
import "package:http/http.dart" as http;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/home.dart';


GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State createState() => WelcomeScreenState();
}

class WelcomeScreenState extends State<WelcomeScreen> {
  GoogleSignInAccount? _currentUser;

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
      });
      if (_currentUser != null) {
        _handleGetContact(_currentUser!);
      }
    });
    _googleSignIn.signInSilently();
  }

  Future<void> _handleGetContact(GoogleSignInAccount user) async {
    
    final http.Response response = await http.get(
      Uri.parse('https://people.googleapis.com/v1/people/me/connections'
          '?requestMask.includeField=person.names'),
      headers: await user.authHeaders,
    );
    if (response.statusCode != 200) {
      print('People API ${response.statusCode} response: ${response.body}');
      return;
    }
  }

  static Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  static Future<void> handleSignOut() => _googleSignIn.disconnect();

  Widget _buildBody() {
    GoogleSignInAccount? user = _currentUser;
    if (user != null) {
      return const HomeScreen();
    } else {
      return Center(
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
                Text("Every contribution counts!",
                    style: GoogleFonts.robotoCondensed(
                        color: const Color(0xff1E2558),
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 25,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10),
                  child: OutlinedButton(
                    onPressed: handleSignIn,
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
                    style: OutlinedButton.styleFrom(
                      onSurface: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset('./images/twitter.png', height: 25),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text('Sign in with Twitter',
                                style: GoogleFonts.workSans(
                                    color: Colors.grey[100],
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400)),
                          )
                        ],
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xff4DA6E9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                    ),
                  ),
                ),
              ]),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EEFF),
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: _buildBody(),
        ));
  }
}

