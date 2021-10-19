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
    return Column(
      children: <Widget>[
        // Divider(color: Colors.grey, height: 32),
        Text('Hours', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 5),
        NumberPicker(
          selectedTextStyle: TextStyle(color: Colors.blue[900], fontSize: 30),
          value: widget.hours,
          minValue: 1,
          maxValue: 24,
          step: 1,
          itemHeight: 50,
          axis: Axis.horizontal,
          onChanged: (value) => setState(() => widget.hours = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black54),
          ),
        ),
        SizedBox(height: 5),
        //Text('Choosed number of hours is : $_currentHoursIntValue'),
        SizedBox(height: 10),
        Text('Days', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 5),
        NumberPicker(
          selectedTextStyle: TextStyle(color: Colors.blue[900], fontSize: 30),
          value: widget.days,
          minValue: 0,
          maxValue: 31,
          step: 1,
          itemHeight: 50,
          axis: Axis.horizontal,
          onChanged: (value) => setState(() => widget.days = value),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.black54),
          ),
        ),
        //Text('Choosed number of days is : $_currentDaysIntValue'),
      ],
    );
  }
}
