import '../model/model.dart';

enum ReducerActions { increment, decrement, reset }

int reducer(int state, action) {
  switch (action) {
    case ReducerActions.increment: return state + 1;
    case ReducerActions.decrement: return state - 1;
    case ReducerActions.reset: return 0;
  }
  return state;
}

AppState appStateReducer(AppState state, action) {
  return AppState(reducer(state.count, action));
}