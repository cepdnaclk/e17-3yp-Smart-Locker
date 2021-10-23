import 'package:flutter/material.dart';
import 'package:smart_locker/service/dataservice.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240, bottom: 10),
                  child: Text("User Name",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF003d80),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF003d80), width: 2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        DataService.user.userData!.UserName.toString(),
                        textScaleFactor: 1.8,
                        style: TextStyle(color: Color(0xFF003d80)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240, bottom: 10),
                  child: Text("User Email",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF003d80), width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF003d80),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        DataService.user.userData!.UserEmail.toString(),
                        textScaleFactor: 1.8,
                        style: TextStyle(color: Color(0xFF003d80)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240, bottom: 10),
                  child: Text("User Mobile",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF003d80), width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF003d80),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        DataService.user.userData!.MobileNumber.toString(),
                        textScaleFactor: 1.8,
                        style: TextStyle(color: Color(0xFF003d80)),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFF003d80), width: 2),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xFF003d80),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Help',
                        textScaleFactor: 1.8,
                        style: TextStyle(color: Color(0xFF003d80)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: FloatingActionButton(
                      child: Icon(Icons.logout_outlined),
                      backgroundColor: Colors.blue[800],
                      onPressed: () {
                        setState(() {
                          DataService.avilableLockers = [];
                          DataService.purchedLockers = [];
                          DataService.jwt = "";
                        });
                        Navigator.pushNamed(context, 'home0');
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
