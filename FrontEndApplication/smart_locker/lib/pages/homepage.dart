import 'package:flutter/material.dart';
import 'package:smart_locker/pages/homepages/controlpanel.dart';
import 'package:smart_locker/pages/homepages/map.dart';
import 'package:smart_locker/pages/homepages/settings.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({Key? key, required this.index}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final homepages = [
    MapPage(),
    ControlPanel(),
    SettingsPage(),
  ];

  initState() {
    currentIndex = widget.index;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: homepages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            iconSize: 30,
            elevation: 10,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(color: Colors.blue[900], size: 40),
            unselectedItemColor: Colors.grey[500],
            currentIndex: currentIndex,
            onTap: (index) => setState(() => currentIndex = index),
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                label: 'Map',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.touch_app),
                label: 'Controll Panel',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_circle),
                label: 'Profile',
              )
            ],
          ),
        ),
      ),
    );
  }
}
