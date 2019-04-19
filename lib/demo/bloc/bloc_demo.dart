
import 'package:flutter/material.dart';
import 'package:widght_flutter/demo/bloc/counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      counterBloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 4.0,
        ),
        body:CounterHome(),
        floatingActionButton:CounterActionButton(),
      ),
    );
  }
}

