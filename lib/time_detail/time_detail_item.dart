import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_calculator/model/model.dart';

import '../view_model.dart';

class TimeDetailItem extends StatelessWidget {
  final TimeItem timeItem;

  const TimeDetailItem({Key key, this.timeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      leading: Icon(Icons.alarm_add),
      title: new Text("${this.timeItem.hours}:${this.timeItem.minutes}"),
      trailing: new StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel model) => new IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () => model.onRemoveTimeItem(timeItem),
              )),
    );
  }
}
