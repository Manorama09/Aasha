import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import './task_detail.dart';
import '../icons/custom_icons.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  Widget task(String s) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 1),
      child: Card(
          elevation: 4.0,
          margin: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 4.0),
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
  CollectionReference ltasks =
      FirebaseFirestore.instance.collection('longTasks');

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xffF4EEFF),
        appBar: AppBar(
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
          bottom: const TabBar(
            tabs: [
              Tab(
                  child: Text("Daily Challenges",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      )),
                  icon: Icon(
                    CustomIcon.leaf,
                    color: Colors.deepPurple,
                  )),
              Tab(
                  child: Text("Lifestyle Changes",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      )),
                  icon: Icon(
                    CustomIcon.earth,
                    color: Colors.deepPurple,
                  )),
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
                  return const Text('Something went wrong!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: Text("Loading", style: TextStyle(color: Colors.deepPurple)));
                }

                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      title: task((document.data() as Map)['name']),
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
                  return const Text('Something went wrong!');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width / 2.2,
                          vertical: MediaQuery.of(context).size.height / 3.5),
                      child: const CircularProgressIndicator());
                }
                return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      title: task((document.data() as Map)['name']),
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
