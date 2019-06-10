import 'package:flutter/material.dart';
import 'package:time_calculator/model/model.dart';

import '../view_model.dart';
import 'TimeDetailItem.dart';

class TimeDetail extends StatelessWidget {
  final ViewModel model;

  TimeDetail({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: model.timeItems
          .map((TimeItem timeItem) => new TimeDetailItem(
                timeItem: timeItem,
              ))
          .toList(),
//      children: <Widget>[
//        new TimeDetailItem(1,7),
//        Divider(),
//        new TimeDetailItem(0,54),
//        Divider(),
//      ],
    );
  }
}
