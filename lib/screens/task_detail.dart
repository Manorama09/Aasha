import 'package:aasha/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottomNavBar.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskDetail extends StatefulWidget {
  final DocumentSnapshot post;
  TaskDetail(this.post);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //bottomNavigationBar: BottomNavBar(),
        backgroundColor: const Color(0xffF4EEFF),
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(widget.post.data()['code'],
                style: GoogleFonts.workSans(
                    color: const Color(0xff1E2558),
                    fontSize: 20,
                    fontWeight: FontWeight.w500)),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Center(
                  child: Text(widget.post.data()['name'],
                      style: GoogleFonts.dancingScript(
                          color: const Color(0xff1E2558),
                          fontSize: 30,
                          fontWeight: FontWeight.w800)),
                ),
                SizedBox(height: 30),
                Text("Did you know?",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(
                  widget.post.data()['fact'],
                  style: GoogleFonts.openSans(
                      color: const Color(0xff1E2558),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text(widget.post.data()['hDesc'],
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(
                  widget.post.data()['desc'],
                  style: GoogleFonts.openSans(
                      color: const Color(0xff1E2558),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 20),
                Text("Note :",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(widget.post.data()['note'],
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                SizedBox(height:20),
                Text("Points : 15",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 18.0),
                    child: FlatButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      color: const Color(0xff4DA6E9),
                      onPressed: _launchURL,
                      child: Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0.0, vertical: 7),
                          child:
                              Image.asset('./images/twitter.png', height: 35),
                        ),
                        Text("Upload on Twitter!",
                            style: GoogleFonts.workSans(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w400)),
                      ]),
                    )),
              ]),
        ));
  }
  _launchURL() async {
  const url = 'https://twitter.com/home';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
  }
}
