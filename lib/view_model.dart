import 'package:redux/redux.dart';
import 'package:time_calculator/redux/actions.dart';

import 'model/model.dart';

class ViewModel {
  final List<TimeItem> timeItems;
  final Function(int, int) onAddTimeItem;
  final Function(TimeItem) onRemoveTimeItem;
  final Function() onRemoveAllTimeItems;

  ViewModel({
    this.timeItems,
    this.onAddTimeItem,
    this.onRemoveTimeItem,
    this.onRemoveAllTimeItems,
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddTimeItem(int hours, int minutes) => store.dispatch(AddTimeItemAction(
          hours: hours,
          minutes: minutes,
        ));
    _onRemoveTimeItem(TimeItem timeItem) => store.dispatch(RemoveTimeItemAction(
          timeItem: timeItem,
        ));
    _onRemoveAllTimeItems() => store.dispatch(RemoveAllTimeItemsAction());

    return ViewModel(
      timeItems: store.state.timeItems,
      onAddTimeItem: _onAddTimeItem,
      onRemoveTimeItem: _onRemoveTimeItem,
      onRemoveAllTimeItems: _onRemoveAllTimeItems,
    );
  }
}
