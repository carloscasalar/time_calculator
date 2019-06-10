import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'TimeDetail/TimeDetail.dart';
import 'TotalTime/TotalTime.dart';
import 'model/model.dart';
import 'redux/redurcers.dart';
import 'view_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'Time calculator',
        theme: ThemeData.dark(),
        home: new MainLayout(),
      ),
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
        floatingActionButton: new StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel model) =>
              AddTimeButton(model: model),
        ));
  }
}

class LayoutBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel model) => new Column(
              children: <Widget>[
                new TotalTime(
                  model: model,
                ),
                Divider(),
                new TimeDetail(
                  model: model,
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
            ));
  }
}

class AddTimeButton extends StatefulWidget {
  final ViewModel model;

  const AddTimeButton({Key key, this.model}) : super(key: key);

  @override
  _AddTimeButton createState() => _AddTimeButton();
}

class _AddTimeButton extends State<AddTimeButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showTimePicker(
            context: context,
            initialTime: TimeOfDay(hour: 0, minute: 0),
            builder: (BuildContext context, Widget child) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(alwaysUse24HourFormat: true),
                child: child,
              );
            }).then<TimeOfDay>((TimeOfDay time) {
          if (time != null) {
            widget.model.onAddTimeItem(time.hour, time.minute);
          }
        });
      },
      tooltip: 'Add new time detail',
      child: Icon(Icons.add),
    );
  }
}
