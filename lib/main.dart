import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MainLayout(),
    );
  }
}

class MainLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Time Calculator'),
      ),
      body: new LayoutBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Add new time detail');
        },
        tooltip: 'Add new time detail',
        child: Icon(Icons.add),
      ),
    );
  }
}

class LayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new TotalTime(),
        Divider(),
        new TimeDetail(),
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}

class TotalTime extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new ListTile(
      leading: Icon(Icons.access_time),
      title: new Container(
        child: new Text(
          'Total: 00:00',
          style: new TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

}

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
