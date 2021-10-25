import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class DurationPicker extends StatefulWidget {
  int hours;
  int days;
  DurationPicker({
    Key? key,
    required this.hours,
    required this.days,
  }) : super(key: key);
  @override
  _DurationPickerState createState() => _DurationPickerState();
}

class _DurationPickerState extends State<DurationPicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40.0),
          bottomRight: Radius.circular(40.0),
          topLeft: Radius.circular(40.0),
          bottomLeft: Radius.circular(40.0),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(1, 5),
            blurRadius: 10.0,
            color: Colors.black.withOpacity(0.3),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          // Divider(color: Colors.grey, height: 32),
          Text('Hours',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF003d80),
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          NumberPicker(
            selectedTextStyle: TextStyle(color: Colors.blue[900], fontSize: 30),
            textStyle: TextStyle(color: Colors.blue[900], fontSize: 20),
            value: widget.hours,
            minValue: 1,
            maxValue: 24,
            step: 1,
            itemHeight: 50,
            axis: Axis.horizontal,
            onChanged: (value) => setState(() => widget.hours = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF003d80), width: 4),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(height: 10),
          Text('Days',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFF003d80),
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 5),
          NumberPicker(
            selectedTextStyle: TextStyle(color: Colors.blue[900], fontSize: 30),
            textStyle: TextStyle(color: Colors.blue[900], fontSize: 20),
            value: widget.days,
            minValue: 0,
            maxValue: 31,
            step: 1,
            itemHeight: 50,
            axis: Axis.horizontal,
            onChanged: (value) => setState(() => widget.days = value),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Color(0xFF003d80), width: 4),
            ),
          ),
        ],
      ),
    );
  }
}
