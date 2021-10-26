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
  final durationPickerDirect = DurationPicker(
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
    DateTime expiredate =
        DateTime.now().add(Duration(hours: hours, days: days));
    return expiredate;
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
        elevation: 8,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Booking',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Enter Locker Number",
              style: TextStyle(
                color: Color(0xFF003d80),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DataInput(
              dataController: lockerNumber,
            ),
            Text(
              "Enter Locker Group Number",
              style: TextStyle(
                color: Color(0xFF003d80),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            DataInput(
              dataController: clusterNumber,
            ),
            Text(
              "Select The Time Duration",
              style: TextStyle(
                color: Color(0xFF003d80),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            durationPickerDirect,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.01,
                ),
                SubmitButton(
                    onSubmitHandler: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/home0', (Route<dynamic> route) => false);
                    },
                    text: "Cancel"),
                SubmitButton(
                    onSubmitHandler: () async {
                      DateTime expiredate = getExpireDate(
                          durationPickerDirect.hours,
                          durationPickerDirect.days);
                      final http.Response response = await purchase(
                          lockerNumber.text.toString(),
                          clusterNumber.text.toString(),
                          expiredate);

                      if (response.statusCode == 200) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home1', (Route<dynamic> route) => false);
                      }
                    },
                    text: "Purchase"),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
