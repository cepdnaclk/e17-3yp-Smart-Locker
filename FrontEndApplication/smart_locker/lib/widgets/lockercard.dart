import 'package:flutter/material.dart';

class LockerCard extends StatelessWidget {
  final String cardName;
  final String location;
  const LockerCard(
    Key key,
    this.cardName,
    this.location,
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
                      Navigator.pushNamed(context, '/purchase');
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
                    color: Colors.blue[800]!.withOpacity(0.8),
                    blurRadius: 0.8,
                    offset: Offset.fromDirection(1, 1),
                  ),
                ],
              )),
          SizedBox(
            height: 10.0,
          )
        ],
      ),
    );
  }
}
