import 'package:flutter/material.dart';
import 'package:smart_locker/models/PurchasedLockersModel.dart';

import 'package:smart_locker/widgets/lockercard.dart';

class LockerList extends StatefulWidget {
  final List<PurchasedLockersModel> lockerList;
  const LockerList({Key? key, required this.lockerList}) : super(key: key);
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
      body: Container(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Card(
                child: Column(
                  children: [
                    (widget.lockerList.isNotEmpty)
                        ? ListView.builder(
                            itemCount: widget.lockerList.length,
                            itemBuilder: (context, index) {
                              if (!widget.lockerList.isEmpty) {
                                return LockerCard(
                                    UniqueKey(),
                                    widget.lockerList[index].LockerID!,
                                    widget.lockerList[index].LockerLocationID!);
                              } else {
                                return Container();
                              }
                            },
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                          )
                        : LockerCard(UniqueKey(), "No Lockers", "Have to add"),
                    SizedBox(
                      height: 20.0,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
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
          )
        ],
      )),
    );
  }
}
