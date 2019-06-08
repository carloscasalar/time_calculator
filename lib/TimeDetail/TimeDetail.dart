import 'package:flutter/material.dart';

import 'TimeDetailItem.dart';
class TimeDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListView(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new TimeDetailItem(1,7),
        Divider(),
        new TimeDetailItem(0,54),
        Divider(),
      ],

    );
  }

}
