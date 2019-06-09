import 'package:time_calculator/model/model.dart';

import 'actions.dart';

AppState appStateReducer(AppState appState, action) =>
    AppState(timeItems: timeReducer(appState.timeItems, action));

List<TimeItem> timeReducer(List<TimeItem> state, action) {
  if (action is AddTimeAction) {
    return []
      ..addAll(state)
      ..add(new TimeItem(
        id: action.id,
        hours: action.hours,
        minutes: action.minutes,
      ));
  }

  if (action is RemoveTimeAction) {
    return List.unmodifiable(List.from(state)..remove(action.time));
  }

  if (action is RemoveAllTimesAction) {
    return List.unmodifiable([]);
  }

  return state;
}
