import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_shop/redux/reducers.dart';
import 'package:flutter_shop/viewmodel/view_model.dart';
import 'package:redux/redux.dart';

import 'model/model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final store = Store<AppState>(
      appStateReducer,
      initialState: AppState.initialState(),
    );

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
          title: 'Incrementor',
          theme: ThemeData(
              buttonTheme: const ButtonThemeData(
                  textTheme: ButtonTextTheme.primary
              ),
              secondaryHeaderColor: Colors.green[600],
              brightness: Brightness.light,
              canvasColor: Colors.grey[200],
              colorScheme: ColorScheme
                  .fromSwatch(primarySwatch: Colors.green)
                  .copyWith(secondary: Colors.greenAccent)
          ),
          home: IncrementorPage()
      ),
    );
  }
}

class IncrementorPage extends StatelessWidget {

  IncrementorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("Incrementor")
        ),
        body: StoreConnector<AppState, ViewModel>(
            converter: (store) => ViewModel.create(store),
            builder: (context, ViewModel viewModel) => Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("${viewModel.count}"),
                  AddButton(viewModel),
                  RemoveButton(viewModel),
                  ResetButton(viewModel)
                ],
              )
            )
        )
    );
  }
}

class AddButton extends StatelessWidget {

  final ViewModel model;
  const AddButton(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Add"),
      onPressed: () => model.increment(),
    );
  }
}

class RemoveButton extends StatelessWidget {

  final ViewModel model;
  const RemoveButton(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Remove"),
      onPressed: () => model.decrement(),
    );
  }
}

class ResetButton extends StatelessWidget {

  final ViewModel model;
  const ResetButton(this.model, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("Reset"),
      onPressed: () => model.reset(),
    );
  }
}