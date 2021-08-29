import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback onSubmitHandler;
  final String text;

  SubmitButton({required this.onSubmitHandler, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42.5,
      width: 135.0,
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [
            Colors.indigo.shade900,
            Colors.lightBlue.shade900,
            Colors.blue.shade800,
          ],
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17.5,
            fontWeight: FontWeight.w400,
          ),
        ),
        onPressed: onSubmitHandler,
      ),
    );
  }
}
