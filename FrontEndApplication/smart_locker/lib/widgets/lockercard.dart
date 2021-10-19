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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (
                          context,
                        ) =>
                                Purchase(
                                  cardName: cardName,
                                  location: location,
                                  lockerID: lockerID,
                                )),
                      );
                    },
                    child: Column(
                      children: [Text(cardName), Text(location)],
                    ),
                  ),
                ),
              ),
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  new BoxShadow(
                    color: Color(0xFF003d80),
                    blurRadius: 0.1,
                    offset: Offset.fromDirection(1, 1),
                  ),
                ],
              )),
          SizedBox(
            height: 20.0,
          )
        ],
      ),
    );
  }
}
