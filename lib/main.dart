import 'package:flutter/material.dart';

import 'TimeDetail/TimeDetail.dart';
import 'TimeService.dart';
import 'TotalTime/TotalTime.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: new TimeState(
        child: new MainLayout(),
      ),
    );
  }
}

class TimeState extends InheritedWidget{
  final timeService = new TimeService();

  TimeState({Widget child}) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static TimeState of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(TimeState);
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
          showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: 0, minute: 0),
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    alwaysUse24HourFormat: true),
                child: child,
              );
            }).then<TimeOfDay>((TimeOfDay time) {
            if (time != null) {
              TimeState.of(context).timeService.addTime(
                new TimeValue(
                  hours: time.hour,
                  minutes: time.minute
                )
              );
            }
          });
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
