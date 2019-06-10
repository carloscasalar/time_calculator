import 'package:time_calculator/model/model.dart';

import 'actions.dart';

AppState appStateReducer(AppState appState, action) =>
    AppState(timeItems: timeReducer(appState.timeItems, action));

List<TimeItem> timeReducer(List<TimeItem> state, action) {
  if (action is AddTimeItemAction) {
    return []
      ..addAll(state)
      ..add(new TimeItem(
        hours: action.hours,
        minutes: action.minutes,
      ));
  }

  if (action is RemoveTimeItemAction) {
    return List.unmodifiable(List.from(state)..remove(action.timeItem));
  }

  if (action is RemoveAllTimeItemsAction) {
    return List.unmodifiable([]);
  }

  return state;
}
