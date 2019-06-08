import 'package:flutter/material.dart';

class TotalTime extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(Icons.access_time),
      title: new Container(
        child: new Text(
          'Total: 00:00',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0
          ),
        ),
      ),
    );
  }
}

