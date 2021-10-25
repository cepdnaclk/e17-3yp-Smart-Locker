import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

alertDialog(
    {required BuildContext context,
    required String title,
    String? message,
    required AlertType alertType}) {
  Alert(
    context: context,
    type: alertType,
    title: title,
    desc: message,
    buttons: [
      DialogButton(
        color: Colors.blue[800],
        splashColor: Colors.blue[200],
        child: Text(
          "Cancle",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    ],
  ).show();
}

purchasecof(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => new AlertDialog(
      title: new Text(
        "Title",
      ),
      content: new Text(
        "Text",
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            DialogButton(
              width: 90.0,
              radius: BorderRadius.circular(18),
              child: Text(
                "Yes",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(true),
            ),
            DialogButton(
              width: 90.0,
              radius: BorderRadius.circular(18),
              child: Text(
                "No",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () => Navigator.of(context).pop(false),
            ),
          ],
        ),
      ],
    ),
  );
}

Future<bool> onBackPressed(BuildContext context) async {
  return await showDialog(
        context: context,
        builder: (context) => new AlertDialog(
          title: new Text(
            "Do You want to exit?",
            style: TextStyle(fontFamily: "Aller", fontWeight: FontWeight.w800),
          ),
          content: new Text(
            "If you exit you have to log again",
          ),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                DialogButton(
                    width: 90.0,
                    color: Color(0xFF003d80),
                    radius: BorderRadius.circular(18),
                    child: Text(
                      "Yes",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    onPressed: () => {
                          Navigator.of(context).pop(true),
                        }),
                DialogButton(
                  width: 90.0,
                  color: Color(0xFF003d80),
                  radius: BorderRadius.circular(18),
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  onPressed: () => Navigator.of(context).pop(false),
                ),
              ],
            ),
          ],
        ),
      ) ??
      Future.value(false);
}
