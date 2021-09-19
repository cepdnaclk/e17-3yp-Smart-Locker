import 'package:flutter/material.dart';
import 'package:smart_locker/pages/homepage.dart';
import 'package:smart_locker/pages/loginpage.dart';
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
        '/home': (context) => HomePage(),
      },
    );
  }
}
