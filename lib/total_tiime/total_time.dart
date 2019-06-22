import 'package:flutter/material.dart';
import 'package:time_calculator/format/format_time.dart';
import 'package:time_calculator/model/model.dart';

import '../view_model.dart';

class TotalTime extends StatelessWidget {
  final ViewModel model;

  const TotalTime({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(
        Icons.access_time,
        size: 30,
      ),
      title: new Container(
        child: new Text(
          'Total  ${this._calculateTotalTime()}',
          style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
        ),
      ),
    );
  }

  String _calculateTotalTime() {
    if (model.timeItems.isEmpty) {
      return "00:00";
    }
    final int hoursInItems = model.timeItems
        .map((TimeItem timeItem) => timeItem.hours)
        .reduce((total, hours) => total + hours);
    final int minutesInItems = model.timeItems
        .map((TimeItem timeItem) => timeItem.minutes)
        .reduce((total, minutes) => total + minutes);

    final int hoursInMinuteItems = (minutesInItems / 60).floor();
    final int totalHours = hoursInItems + hoursInMinuteItems;
    final int totalMinutes = minutesInItems - hoursInMinuteItems * 60;

    String minutesString = formatTime(totalMinutes);

    return "$totalHours:$minutesString";
  }
}
