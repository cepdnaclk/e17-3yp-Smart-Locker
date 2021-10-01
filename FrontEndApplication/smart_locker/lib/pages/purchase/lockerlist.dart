import 'package:flutter/material.dart';

class LockerList extends StatefulWidget {
  const LockerList({Key? key}) : super(key: key);

  @override
  _LockerListState createState() => _LockerListState();
}

class _LockerListState extends State<LockerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
        elevation: 8,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Lockers List',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: Container(),
    );
  }
}
