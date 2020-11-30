import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/bottomNavBar.dart';

class RanksScreen extends StatelessWidget {
  Widget rank(String s, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        //bottomNavigationBar: BottomNavBar(),
        backgroundColor: const Color(0xffF4EEFF),
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(60, 0, 0, 0),
            child: Text("Leaderboard",
                style: GoogleFonts.dancingScript(
                    color: const Color(0xff1E2558),
                    fontSize: 35,
                    fontWeight: FontWeight.w700)),
          ),
          bottom: TabBar(
            tabs: [
              Tab(child:Text("Individual"),icon: Icon(Icons.people)),
              Tab(child:Text("Regions"),icon: Icon(Icons.location_city)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                rank("#1 Manorama Maharana", context),
                rank("#2 Kartavya Asthana", context),
                rank("#3 Riddhi Gupta", context),
                rank("#4 Saloni Parekh", context),
                rank("#5 Sanchi Chopra", context),
                rank("#6 Saksham Gupta", context),
                rank("#7 Abhishek Singh", context),
                rank("#8 Ritika Kayal", context),
                rank("#9 Anusuiya Bora", context),
                rank("#10 Aditi Goel", context),
              ],
            ),
            ListView(
              children: <Widget>[
                rank("#1 Indore", context),
                rank("#2 Surat", context),
                rank("#3 Navi Mumbai", context),
                rank("#4 Ambikapur", context),
                rank("#5 Mysore", context),
                rank("#6 Vijayawada", context),
                rank("#7 Ahmedabad", context),
                rank("#8 New Delhi", context),
                rank("#9 Chandrapur", context),
                rank("#10 Khargone", context),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
