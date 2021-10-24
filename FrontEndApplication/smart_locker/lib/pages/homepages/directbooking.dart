import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/datainput.dart';

import 'package:smart_locker/widgets/submitbutton.dart';
import 'package:smart_locker/widgets/durationpicker.dart';

class DirectBooking extends StatefulWidget {
  const DirectBooking({Key? key}) : super(key: key);
  @override
  _DirectBookingState createState() => _DirectBookingState();
}

class _DirectBookingState extends State<DirectBooking> {
  final lockerNumber = TextEditingController();
  final clusterNumber = TextEditingController();
  final durationPicker = DurationPicker(
    hours: 1,
    days: 0,
  );

  Future<http.Response> purchase(
    String lockerNumber,
    String clusterNumber,
    DateTime expiredate,
  ) async {
    final String apiUrl = DataService.ip + "/api/purchase/direct";

    Map<String, String> data = {
      "expireDate": expiredate.toString(),
      "lockerNumber": lockerNumber,
      "clusterNumber": clusterNumber,
    };

    final body = json.encode(data);

    final response = await http.post(Uri.parse(apiUrl),
        headers: {
          "Content-Type": "application/json",
          "x-auth-token": DataService.jwt,
        },
        body: body);

    return response;
  }

  DateTime getExpireDate(int hours, int days) {
    DateTime expiredate = DateTime.now();
    expiredate.add(Duration(hours: hours, days: days));
    return expiredate;
  }

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
        elevation: 8,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Booking',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            child: Column(
              children: [
                Text(
                  "Enter Locker Number",
                  style: TextStyle(
                    color: Color(0xFF003d80),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DataInput(
                  dataController: lockerNumber,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Enter Locker Group Number",
                  style: TextStyle(
                    color: Color(0xFF003d80),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                DataInput(
                  dataController: clusterNumber,
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Select The Time Duration",
                  style: TextStyle(
                    color: Color(0xFF003d80),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                durationPicker,
                SizedBox(
                  height: 30,
                ),
                SubmitButton(
                    onSubmitHandler: () async {
                      DateTime expiredate = getExpireDate(
                          durationPicker.hours, durationPicker.days);

                      final http.Response response = await purchase(
                          lockerNumber.text.toString(),
                          clusterNumber.text.toString(),
                          expiredate);
                      print(response.body);
                      if (response.statusCode == 200) {
                        Navigator.pushNamed(context, '/home1');
                      } else {
                        print("A");
                      }
                    },
                    text: "Purchase"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
