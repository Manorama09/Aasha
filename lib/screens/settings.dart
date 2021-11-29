import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../screens/welcome.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'English';
    String dropdownValue1 = 'Bangalore';

    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      backgroundColor: const Color(0xffF4EEFF),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Text("Settings",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Choose a Language:",
                style: GoogleFonts.workSans(
                    color: const Color(0xff1E2558),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 20),
            DropdownButton<String>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['English', 'Hindi', 'Kannada', 'Tamil']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            Text("Choose your location:",
                style: GoogleFonts.workSans(
                    color: const Color(0xff1E2558),
                    fontSize: 16,
                    fontWeight: FontWeight.w400)),
            const SizedBox(width: 10),
            DropdownButton<String>(
              value: dropdownValue1,
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Bangalore', 'Delhi', 'Chennai', 'Mumbai']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ]),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: ElevatedButton(
                onPressed: () {
                  WelcomeScreenState.handleSignOut();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) {
                    return const WelcomeScreen();
                  }), ModalRoute.withName('/'));
                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  primary: Colors.deepPurple,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50),
                  child: Text('Sign Out',
                      style: GoogleFonts.workSans(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500)),
                ),
              ))
        ]),
      ),
    );
  }
}
