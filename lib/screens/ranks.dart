import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RanksScreen extends StatelessWidget {
  const RanksScreen({ Key? key }) : super(key: key);

  Widget rank(String s, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 1.5),
      child: Card(
          elevation: 4.0,
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffB180FE).withOpacity(0.45)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 20),
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
        appBar: AppBar(
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
          bottom: const TabBar(
            tabs: [
              Tab(child:Text("Individual",style: TextStyle(color: Colors.deepPurple,)),icon: Icon(Icons.people, color: Colors.deepPurple,)),
              Tab(child:Text("Regions",style: TextStyle(color: Colors.deepPurple,)),icon: Icon(Icons.location_city, color: Colors.deepPurple,)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: <Widget>[
                rank("#1 Manorama Maharana        105", context),
                rank("#2 Kartavya Asthana             95", context),
                rank("#3 Riddhi Gupta                   85", context),
                rank("#4 Saloni Parekh                  65", context),
                rank("#5 Sanchi Chopra                 60", context),
                rank("#6 Saksham Gupta               55", context),
                rank("#7 Abhishek Singh                40", context),
                rank("#8 Ritika Kayal                     35", context),
                rank("#9 Anusuiya Bora                 30", context),
                rank("#10 Aditi Goel                      15", context),
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