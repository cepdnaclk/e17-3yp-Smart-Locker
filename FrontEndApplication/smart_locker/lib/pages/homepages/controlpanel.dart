import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_locker/models/LockerLocationDetailsModel.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/animatedtoggle.dart';
import 'package:share/share.dart';
import 'package:intl/intl.dart';
import 'package:smart_locker/widgets/usermap.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  _ControlPanelState createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  String? _chosenValue;
  int? index;
  int _toggleValue = 0;
  List<String?> lockerNames = [];

  Future<http.Response> getLockerList() async {
    final String apiUrl = DataService.ip + "/api/lockerdetails";

    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        "Content-Type": "application/json",
        "x-auth-token": DataService.jwt,
      },
    );
    return response;
  }

  void _getData() async {
    final http.Response response = await getLockerList();
    if (response.statusCode == 200) {
      var r = json.decode(response.body);
      setState(() {
        DataService.userLockers = List<LockerLocationDetailsModel>.from(
            r["lockerdetails"]
                .map((model) => LockerLocationDetailsModel.fromJson(model)));
        DataService.userLockers.forEach((element) {
          lockerNames.add(element.LocationDescription.toString() +
              "(No:" +
              element.LockerNumber.toString() +
              ")");
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

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
          style: TextStyle(
            fontSize: 22,
            color: Colors.black87,
            fontFamily: 'Aller',
            fontWeight: FontWeight.bold,
          ),
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
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 4),
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ],
                  // border: Border.all(color: Color(0xFF003d80), width: 0),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0)),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    index != null
                        ? DataService.userLockers[index!].LocationDescription
                            .toString()
                        : "",
                    textScaleFactor: 1.8,
                    style: TextStyle(color: Colors.black, fontFamily: "Aller"),
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
                    index != null
                        ? DateFormat('yyyy/MM/dd  hh:mm a')
                            .format(DataService.userLockers[index!].ExpireDate!)
                            .toString()
                        : "",
                    textScaleFactor: 1.8,
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
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(1, 6),
                      blurRadius: 10.0,
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
                    index != null
                        ? DataService.userLockers[index!].OneTimeToken
                            .toString()
                        : "",
                    textScaleFactor: 1.8,
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
                          width: MediaQuery.of(context).size.width * 0.16,
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
                        width: MediaQuery.of(context).size.width * 0.16,
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
                        width: MediaQuery.of(context).size.width * 0.16,
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
                              Share.share(DataService
                                      .userLockers[index!].SharedOneTimeToken
                                      .toString() +
                                  "\n" +
                                  DataService.userLockers[index!].LocationUrl
                                      .toString());
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
                        width: MediaQuery.of(context).size.width * 0.16,
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

  Container SelectLocker(BuildContext context, List<String?> lockerNames) {
    return Container(
      color: Colors.blue[100],
      height: MediaQuery.of(context).size.height * 0.08,
      width: MediaQuery.of(context).size.width * 1,
      child: Center(
        child: DropdownButtonHideUnderline(
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
            items: lockerNames.map<DropdownMenuItem<String>>((String? value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value!,
                  style: TextStyle(
                    color: Color(0xFF003d80),
                    fontFamily: "Aller",
                  ),
                ),
              );
            }).toList(),
            hint: Text(
              "Please Select Your Locker",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            onChanged: (String? value) {
              setState(() {
                _chosenValue = value;
                index = lockerNames.indexOf(value);
              });
            },
          ),
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
            child: index != null
                ? UserMap(
                    index: index!,
                  )
                : Container(
                    child: Center(
                        child: Text(
                      "You have not chosen a locker",
                      style: TextStyle(fontSize: 24),
                    )),
                  ),
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
