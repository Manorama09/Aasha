import 'package:aasha/screens/analysis.dart';
import 'package:aasha/screens/news.dart';
import 'package:aasha/screens/ranks.dart';
import 'package:aasha/screens/settings.dart';
import 'package:aasha/screens/tasks.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int selectedIndex = 0;
  final widgetOptions = [
    TasksScreen(),
    RanksScreen(),
    NewsScreen(),
    Analysis(),
    SettingsScreen(),
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.note),
            label: 'Tasks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Ranks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: selectedIndex,
        fixedColor: Colors.deepPurple,
        onTap: onItemTapped,
      ),
      ],
    );
  }
}
