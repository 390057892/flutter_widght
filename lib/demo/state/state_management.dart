import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: CounterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('StateManagementDemo'),
          elevation: 0,
        ),
        body: CounterWrapper(),
        floatingActionButton: ScopedModelDescendant<CounterModel>(
          rebuildOnChange: false,
          builder: (context, _, model) => FloatingActionButton(
                onPressed: model.increaseCount,
                child: Icon(Icons.add),
              ),
        ),
      ),
    );
  }
}

// class StateManagementDemo extends StatefulWidget {
//   @override
//   _StateManagementDemoState createState() => _StateManagementDemoState();
// }

// class _StateManagementDemoState extends State<StateManagementDemo> {
//   int _count = 0;
//   void _increaseCount() {
//     setState(() {
//       _count -= 1;
//     });
//     print(_count);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CounterProvider(
//         count: _count,
//         increateCount: _increaseCount,
//         child: Scaffold(
//           appBar: AppBar(
//             title: Text('StateManagementDemo'),
//             elevation: 0,
//           ),
//           body: CounterWrapper(),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               setState(() {
//                 _count += 1;
//               });

//               print(_count);
//             },
//             child: Icon(Icons.add),
//           ),
//         ));
//   }
// }

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final int count = CounterProvider.of(context).count;
    // final VoidCallback increateCount =
    //     CounterProvider.of(context).increateCount;
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
          label: Text('${model._count}'),
          onPressed: () {
            model.increaseCount();
          }),
      // label: Text('$count'),
      // onPressed: () {
      //   increateCount();
      // },
    );
  }
}

class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increateCount;
  final Widget child;

  CounterProvider({this.count, this.increateCount, this.child})
      : super(child: child);

  static CounterProvider of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CounterProvider)
        as CounterProvider);
  }

  @override
  bool updateShouldNotify(CounterProvider oldWidget) {
    return true;
  }
}

class CounterModel extends Model {
  int _count = 0;
  int get count => _count;
  void increaseCount() {
    _count += 1;
    notifyListeners();
  }
}
