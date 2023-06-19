import 'package:redux/redux.dart';

import '../model/model.dart';
import '../redux/reducers.dart';

class ViewModel {

  final Function() increment;
  final Function() decrement;
  final Function() reset;
  final int count;

  ViewModel({
    required this.count,
    required this.increment,
    required this.decrement,
    required this.reset,
  });

  factory ViewModel.create(Store<AppState> store) {

    onIncrement() {
      store.dispatch(ReducerActions.increment);
    }

    onDecrement() {
      store.dispatch(ReducerActions.decrement);
    }

    onReset() {
      store.dispatch(ReducerActions.reset);
    }

    return ViewModel(
        count: store.state.count,
        increment: onIncrement,
        decrement: onDecrement,
        reset: onReset
    );
  }
}