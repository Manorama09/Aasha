import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TaskDetail extends StatefulWidget {
  final DocumentSnapshot post;
  // ignore: use_key_in_widget_constructors
  const TaskDetail(this.post);

  @override
  _TaskDetailState createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        backgroundColor: const Color(0xffF4EEFF),
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Text(
                widget.post.data() != null
                    ? (widget.post.data() as Map)['code']
                    : "Information could not be retrieved",
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
                const SizedBox(height: 20),
                Center(
                  child: Text(
                      widget.post.data() != null
                          ? (widget.post.data() as Map)['name']
                          : "Information could not be retrieved",
                      style: GoogleFonts.dancingScript(
                          color: const Color(0xff1E2558),
                          fontSize: 30,
                          fontWeight: FontWeight.w800)),
                ),
                const SizedBox(height: 30),
                Text("Did you know?",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(
                  widget.post.data() != null
                      ? (widget.post.data() as Map)['fact']
                      : "Information could not be retrieved",
                  style: GoogleFonts.openSans(
                      color: const Color(0xff1E2558),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                    widget.post.data() != null
                        ? (widget.post.data() as Map)['hDesc']
                        : "Information could not be retrieved",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(
                  widget.post.data() != null
                      ? (widget.post.data() as Map)['desc']
                      : "Information could not be retrieved",
                  style: GoogleFonts.openSans(
                      color: const Color(0xff1E2558),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text("Note :",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Text(
                    widget.post.data() != null
                        ? (widget.post.data() as Map)['note']
                        : "Information could not be retrieved",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 16,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 20),
                Text("Points : 15",
                    style: GoogleFonts.openSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w700)),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 18.0),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xff4DA6E9),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                      ),
                      onPressed: () async {
                        await _launchURL("https://twitter.com");
                      },
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

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
