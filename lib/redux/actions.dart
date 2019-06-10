import 'package:flutter/foundation.dart';
import 'package:time_calculator/model/model.dart';

class AddTimeItemAction {
  final int hours;
  final int minutes;

  AddTimeItemAction({
    @required this.hours,
    @required this.minutes,
  });
}

class RemoveTimeItemAction {
  final TimeItem timeItem;

  RemoveTimeItemAction({
    @required this.timeItem,
  });
}

class RemoveAllTimeItemsAction {}
