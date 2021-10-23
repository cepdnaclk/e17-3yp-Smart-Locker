import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_locker/service/dataservice.dart';
import 'package:smart_locker/widgets/submitbutton.dart';
import 'package:smart_locker/widgets/durationpicker.dart';

class Purchase extends StatefulWidget {
  final String cardName;
  final String location;
  final String lockerID;
  const Purchase(
      {Key? key,
      required this.cardName,
      required this.location,
      required this.lockerID})
      : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  final durationPicker = DurationPicker(
    hours: 1,
    days: 0,
  );

  Future<http.Response> purchase(
    String lockerID,
    DateTime expiredate,
  ) async {
    final String apiUrl = DataService.ip + "/api/purchase/" + lockerID;

    Map<String, String> data = {
      "expireDate": expiredate.toString(),
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
          'Purchase',
          style: TextStyle(fontSize: 22, color: Colors.black87),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "You have chosen",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF003d80)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Color(0xFF003d80), width: 3),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Center(
                  child: Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Locker Details",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF003d80)),
                            ),
                            Text(
                              "Locker Number- " + widget.cardName,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF003d80)),
                            ),
                            Text(
                              "Location- " + widget.location,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF003d80)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                "Select The Time Duration",
                style: TextStyle(
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
                    print(expiredate.toString());
                    final http.Response response =
                        await purchase(widget.lockerID, expiredate);
                    print(response.body);
                    if (response.statusCode == 200) {
                      Navigator.pushNamed(context, '/home1');
                    }
                  },
                  text: "Purchase"),
            ],
          ),
        ),
      ),
    );
  }
}
