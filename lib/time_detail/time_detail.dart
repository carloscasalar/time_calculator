import 'package:flutter/material.dart';

import '../view_model.dart';
import 'time_detail_item.dart';

class TimeDetail extends StatelessWidget {
  final ViewModel model;

  TimeDetail({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListView.separated(
      shrinkWrap: true,
      //padding: const EdgeInsets.all(8.0),
      scrollDirection: Axis.vertical,
      separatorBuilder: (BuildContext context, int index) => const Divider(),
      itemCount: model.timeItems.length,
      itemBuilder: (BuildContext context, int index) =>
          new TimeDetailItem(timeItem: model.timeItems[index]),
//      children: model.timeItems
//          .map((TimeItem timeItem) => new TimeDetailItem(
//                timeItem: timeItem,
//              ))
//          .toList(),
//      children: <Widget>[
//        new TimeDetailItem(1,7),
//        Divider(),
//        new TimeDetailItem(0,54),
//        Divider(),
//      ],
    );
  }
}
