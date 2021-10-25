import 'package:flutter/material.dart';
import 'package:smart_locker/pages/purchase/purchase.dart';

class LockerCard extends StatelessWidget {
  final String cardName;
  final String location;
  final String lockerID;
  const LockerCard(
    Key key,
    this.cardName,
    this.location,
    this.lockerID,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              elevation: 10.0,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (
                            context,
                          ) =>
                              Purchase(
                            cardName: cardName,
                            location: location,
                            lockerID: lockerID,
                          ),
                        ),
                        ModalRoute.withName("/home0"),
                      );
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Number",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  cardName,
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF003d80),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 4,
                          decoration: BoxDecoration(
                              color: Color(0xFF003d80),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        Expanded(
                          flex: 6,
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(fontSize: 20),
                                ),
                                Text(
                                  location,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF003d80)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            decoration: new BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: Offset(1, 5),
                  blurRadius: 20.0,
                  color: Colors.black.withOpacity(0.3),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
