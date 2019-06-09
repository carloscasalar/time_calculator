import 'package:flutter/foundation.dart';
import 'package:time_calculator/model/model.dart';

class AddTimeAction {
  final String id;
  final int hours;
  final int minutes;

  AddTimeAction({
    @required this.id,
    @required this.hours,
    @required this.minutes,
  });
}

class RemoveTimeAction {
  final TimeItem time;

  RemoveTimeAction({
    @required this.time,
  });
}

class RemoveAllTimesAction {}
