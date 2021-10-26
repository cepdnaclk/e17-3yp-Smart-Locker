import 'package:flutter/material.dart';

class DataInput extends StatelessWidget {
  const DataInput({
    Key? key,
    required this.dataController,
  }) : super(key: key);

  final TextEditingController dataController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.14,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: TextField(
        cursorColor: Colors.blue[900],
        controller: dataController,
        keyboardType: TextInputType.text,
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 32.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 32.0),
              borderRadius: BorderRadius.circular(20.0)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white, width: 32.0),
            borderRadius: BorderRadius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
