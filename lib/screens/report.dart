import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportScreen extends StatelessWidget {
  String dropdownValue = 'Bangalore';

  ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4EEFF),
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: const Color(0xffF4EEFF),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(90, 0, 0, 0),
          child: Text("Report",
              style: GoogleFonts.dancingScript(
                  color: const Color(0xff1E2558),
                  fontSize: 35,
                  fontWeight: FontWeight.w700)),
        ),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 40),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text("Choose your location:",
              style: GoogleFonts.workSans(
                  color: const Color(0xff1E2558),
                  fontSize: 16,
                  fontWeight: FontWeight.w400)),
          const SizedBox(width: 10),
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
            items: <String>['Bangalore', 'Delhi', 'Chennai', 'Mumbai']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
        ]),
        const SizedBox(height: 40),
        const SizedBox(
            width: 300,
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Register your complaint here',
                hintText: 'Register your complaint here',
              ),
              autofocus: false,
            )),
        const SizedBox(height: 40),
        OutlinedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 55),
              child: Text("Report the Area",
                  style: GoogleFonts.workSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          style: OutlinedButton.styleFrom(
            backgroundColor: const Color(0xff4DA6E9),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ])),
      //bottomNavigationBar: BottomNavBar(),
    );
  }

  void setState(Null Function() param0) {}
}
