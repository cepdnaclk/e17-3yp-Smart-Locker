import 'package:flutter/material.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';

import 'package:smart_locker/widgets/lockercard.dart';

class LockerList extends StatefulWidget {
  final List<PurchasedLockersModel> lockerList;
  final String location;
  const LockerList({Key? key, required this.lockerList, required this.location})
      : super(key: key);
  @override
  _LockerListState createState() => _LockerListState();
}

class _LockerListState extends State<LockerList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
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
      body: Container(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.blue[100],
              width: MediaQuery.of(context).size.height * 0.9,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.0,
                  ),
                  (widget.lockerList.isNotEmpty)
                      ? ListView.builder(
                          itemCount: widget.lockerList.length,
                          itemBuilder: (context, index) {
                            if (!widget.lockerList.isEmpty) {
                              return LockerCard(
                                  UniqueKey(),
                                  widget.lockerList[index].LockerNumber
                                      .toString(),
                                  widget.location,
                                  widget.lockerList[index].LockerID!);
                            } else {
                              return Container();
                            }
                          },
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                        )
                      : LockerCard(
                          UniqueKey(), "No Lockers", "Have to add", ""),
                  SizedBox(
                    height: 80.0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  child: Container(
                    color: Colors.blue[800],
                    child: Center(
                      child: Text(
                        "Select a locker",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
