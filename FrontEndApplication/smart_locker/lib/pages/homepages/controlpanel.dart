import 'package:flutter/material.dart';
import 'package:smart_locker/widgets/animatedtoggle.dart';
import 'package:share/share.dart';
import 'package:smart_locker/widgets/usermap.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  String? _chosenValue;
  int _toggleValue = 0;
  List<String> lockerNames = [
    "Locker1",
    "Locker2",
    "Locker3",
    "Locker4",
  ];
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
          'Control Panel',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.02,
              color: Colors.blue[50],
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectLocker(context, lockerNames),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Container(
              padding: EdgeInsets.only(right: 180, bottom: 10),
              child: Text("Location Details",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.90,
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
                    '',
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 200, bottom: 10, top: 10),
              child: Text("Expire Date",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.90,
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
                    '',
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 200, bottom: 10, top: 10),
              child: Text("Locker Token",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.90,
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
                    '',
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text("Empty",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.18,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(color: Color(0xFF003d80), width: 3),
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                          ),
                          child: Container(
                            child: Center(
                              child: Text("Yes"),
                            ),
                          )),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text("Location",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFF003d80), width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.map_outlined),
                            onPressed: () {
                              // This function can find at bottom of the code
                              _getMap(context);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text("Share Token",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFF003d80), width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () {
                              Share.share(
                                  "This is your password and locker details\nUOP");
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 10, top: 10),
                        child: Text("Open",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w600)),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.18,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border:
                              Border.all(color: Color(0xFF003d80), width: 3),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Center(
                          child: Text("Yes"),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            AnimatedToggle(
              values: ['Lock', 'Unlock'],
              onToggleCallback: (value) {
                setState(() {
                  _toggleValue = value;
                });
              },
              buttonColor: const Color(0xFF003d80),
              backgroundColor: const Color(0xFFB5C1CC),
              textColor: const Color(0xFFFFFFFF),
            ),
          ],
        ),
      ),
    );
  }

  Container SelectLocker(BuildContext context, List<String> lockerNames) {
    return Container(
      color: Colors.blue[100],
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: DropdownButton<String>(
          icon: const Icon(Icons.keyboard_arrow_down),
          iconSize: 24,
          focusColor: Colors.white,
          value: _chosenValue,
          elevation: 16,
          style: TextStyle(
              color: Colors.blue[800],
              fontSize: 20,
              fontWeight: FontWeight.bold),
          iconEnabledColor: Colors.black,
          dropdownColor: Colors.white,
          underline: Container(
            height: 4,
            color: Color(0xFF003d80),
          ),
          items: lockerNames.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.blue[900]),
              ),
            );
          }).toList(),
          hint: Text(
            "Please Select Your Locker",
            style: TextStyle(
                color: Colors.blue[800],
                fontSize: 20,
                fontWeight: FontWeight.w800),
          ),
          onChanged: (String? value) {
            setState(() {
              _chosenValue = value;
            });
          },
        ),
      ),
    );
  }

  void _getMap(context) {
    showModalBottomSheet(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Stack(children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            child: UserMap(),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.70,
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.cancel,
                color: Color(0xFF003d80),
                size: 35,
              ),
            ),
          )
        ]);
      },
    );
  }
}
