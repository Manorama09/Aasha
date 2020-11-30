import 'package:aasha/screens/task_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../widgets/bottomNavBar.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget task(String s) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Card(
          elevation: 4.0,
          margin: new EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
          child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xffB180FE).withOpacity(0.45)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30),
                child: Text(s,
                    style: GoogleFonts.workSans(
                        color: const Color(0xff1E2558),
                        fontSize: 18,
                        fontWeight: FontWeight.w400)),
              ))),
    );
  }

  navigateToDetail(DocumentSnapshot post) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TaskDetail(post)));
  }

  CollectionReference tasks = FirebaseFirestore.instance.collection('tasks');
  CollectionReference ltasks = FirebaseFirestore.instance.collection('longTasks');
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF4EEFF),
        appBar: new AppBar(
          elevation: 0.1,
          backgroundColor: const Color(0xffF4EEFF),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(40, 0, 0, 0),
            child: Text("E-Challenges",
                style: GoogleFonts.dancingScript(
                    color: const Color(0xff1E2558),
                    fontSize: 35,
                    fontWeight: FontWeight.w700)),
          ),
          bottom: TabBar(
            tabs: [
              Tab(child:Text("Daily"),icon: Icon(Icons.list)),
              Tab(child:Text("Long Term"),icon: Icon(Icons.calendar_today)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder<QuerySnapshot>(
              stream: tasks.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: task(document.data()['name']),
                      onTap: () => navigateToDetail(document),
                    );
                  }).toList(),
                );
              },
            ),
             StreamBuilder<QuerySnapshot>(
              stream: ltasks.snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Something went wrong!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text("Loading");
                }

                return new ListView(
                  children: snapshot.data.docs.map((DocumentSnapshot document) {
                    return new ListTile(
                      title: task(document.data()['name']),
                      onTap: () => navigateToDetail(document),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
        //bottomNavigationBar: BottomNavBar(),
      ),
    );
  }
}
