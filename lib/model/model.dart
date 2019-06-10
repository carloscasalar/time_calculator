import 'package:flutter/foundation.dart';

class TimeItem {
  final int hours;
  final int minutes;

  TimeItem({
    @required this.hours,
    @required this.minutes,
  });

  TimeItem copyWith({String id, int hours, int minutes}) {
    return new TimeItem(
        hours: hours ?? this.hours, minutes: minutes ?? this.minutes);
  }
}

class AppState {
  final List<TimeItem> timeItems;

  AppState({
    @required this.timeItems,
  });

  AppState.initialState() : timeItems = List.unmodifiable(<TimeItem>[]);
}
