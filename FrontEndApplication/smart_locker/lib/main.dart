import 'package:flutter/material.dart';
import 'package:smart_locker/models/locker.dart';
import 'package:smart_locker/pages/homepage.dart';
import 'package:smart_locker/pages/loginpage.dart';
import 'package:smart_locker/pages/purchase/lockerlist.dart';
import 'package:smart_locker/pages/signuppage.dart';

void main() {
  runApp(MyApp());
}

//final List<Locker> list = [];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Locker",
      home: LockerList(
        lockerList: [
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          ),
          Locker(
            'lockerID',
            'lockerUserID',
            'lockerLocationID',
            'clusterID',
            true,
            true,
            'oneTimeToken',
            'sharedOneTimeToken',
            2,
            DateTime.now(),
          )
        ],
      ),
      routes: {
        '/login': (context) => LogInPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => HomePage(),
        //'/lockerlist': (context) => LockerList(lockerList: list)
      },
    );
  }
}
