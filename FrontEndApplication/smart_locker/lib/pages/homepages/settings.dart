import 'package:flutter/material.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/submitbutton.dart';

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
            bottom: Radius.circular(10),
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontFamily: "Aller",
            fontWeight: FontWeight.bold,
          ),
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
                  child: Text(
                    "User Name",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Aller",
                    ),
                  ),
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
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(1, 4),
                          blurRadius: 20.0,
                          color: Colors.black.withOpacity(0.6),
                        ),
                      ],
                      // border: Border.all(color: Color(0xFF003d80), width: 2),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomRight: Radius.circular(10.0)),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        DataService.user.userData != null
                            ? DataService.user.userData!.UserName.toString()
                            : "No User",
                        textScaleFactor: 1.8,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aller",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240, bottom: 10),
                  child: Text(
                    "User Email",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Aller",
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 4),
                        blurRadius: 20.0,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ],
                    // border: Border.all(color: Color(0xFF003d80), width: 2),
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
                        DataService.user.userData != null
                            ? DataService.user.userData!.UserEmail.toString()
                            : "No Email",
                        textScaleFactor: 1.8,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Aller",
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Container(
                  padding: EdgeInsets.only(right: 240, bottom: 10),
                  child: Text(
                    "User Mobile",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Aller",
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.08,
                  width: MediaQuery.of(context).size.width * 0.96,
                  padding: EdgeInsets.only(left: 12.0),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(1, 4),
                        blurRadius: 20.0,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ],
                    // border: Border.all(color: Color(0xFF003d80), width: 2),
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
                        DataService.user.userData != null
                            ? DataService.user.userData!.MobileNumber.toString()
                            : "No User",
                        textScaleFactor: 1.8,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SubmitButton(onSubmitHandler: () {}, text: "Help"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    padding: EdgeInsets.all(30),
                    child: FloatingActionButton(
                      child: Icon(Icons.logout_outlined),
                      backgroundColor: Color(0xFF003d80),
                      onPressed: () {
                        setState(() {
                          DataService.avilableLockers = [];
                          DataService.purchedLockers = [];
                          DataService.jwt = "";
                        });
                        Navigator.pushNamedAndRemoveUntil(
                            context, '/login', (r) => false);
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
