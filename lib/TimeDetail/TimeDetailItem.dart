import 'package:flutter/material.dart';

class TimeDetailItem extends StatelessWidget {
  final hours;
  final minutes;

  TimeDetailItem(this.hours, this.minutes);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      leading: Icon(Icons.alarm_add),
      title: new Text("${this.hours}:${this.minutes}"),
    );
  }
}
