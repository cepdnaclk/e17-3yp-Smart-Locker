import 'package:flutter/material.dart';
import 'package:smart_locker/pages/homepage.dart';
import 'package:smart_locker/pages/loginpage.dart';
import 'package:smart_locker/pages/purchase/lockerlist.dart';
import 'package:smart_locker/pages/purchase/purchase.dart';
import 'package:smart_locker/pages/signuppage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Locker",
      home: LogInPage(),
      routes: {
        '/login': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(),
        '/home0': (context) => HomePage(
              index: 0,
            ),
        '/home1': (context) => HomePage(
              index: 1,
            ),
        '/lockerlist': (context) {
          return LockerList(
            lockerList: [],
            location: "",
          );
        },
        '/purchase': (context) =>
            Purchase(cardName: "", location: "", lockerID: ""),
      },
    );
  }
}
