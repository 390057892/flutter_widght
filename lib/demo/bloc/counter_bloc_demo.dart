import 'dart:async';

import 'package:flutter/material.dart';

class CounterHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).counterBloc;
    return Center(
      child: StreamBuilder(
        initialData: 0,
        stream: _counterBloc.count,
        builder: (context, snapshot) {
          return ActionChip(
              label: Text('${snapshot.data}'),
              onPressed: () {
                _counterBloc.counter.add(1);
              });
        },
      ),
    );
  }
}

class CounterActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc _counterBloc = CounterProvider.of(context).counterBloc;
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () {
        _counterBloc.counter.add(1);
      },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final CounterBloc counterBloc;
  final Widget child;

  const CounterProvider({
    this.counterBloc,
    this.child,
  }) : super(child: child);

  static CounterProvider of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider;
  }

  @override
  bool updateShouldNotify(CounterProvider old) {
    return true;
  }
}

class CounterBloc {
  int _count = 0;

  final _counterActionController = StreamController<int>();
  final _countController = StreamController<int>();

  StreamSink<int> get counter => _counterActionController.sink;

  Stream<int> get count => _countController.stream;

  CounterBloc() {
    _counterActionController.stream.listen(onData);
  }

  void onData(int data) {
    print('$data');
    _count = data + _count;
    _countController.add(_count);
  }

  void dispose() {
    _counterActionController.close();
    _countController.close();
  }

  void log() {
    print('Bloc');
  }
}
