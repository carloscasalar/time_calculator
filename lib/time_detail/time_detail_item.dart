import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:time_calculator/format/format_time.dart';
import 'package:time_calculator/model/model.dart';

import '../view_model.dart';

class TimeDetailItem extends StatelessWidget {
  final TimeItem timeItem;

  const TimeDetailItem({Key key, this.timeItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(
        this._formattedTime(),
        style: TextStyle(fontSize: 25.0),
        textAlign: TextAlign.center,
      ),
      leading: new StoreConnector<AppState, ViewModel>(
          converter: (Store<AppState> store) => ViewModel.create(store),
          builder: (BuildContext context, ViewModel model) => new IconButton(
                icon: Icon(
                  Icons.delete_forever,
                  color: Theme.of(context).accentColor,
                  size: 30.0,
                ),
                onPressed: () => model.onRemoveTimeItem(timeItem),
              )),
    );
  }

  _formattedTime() =>
      "${this.timeItem.hours}:${formatTime(this.timeItem.minutes)}";
}
