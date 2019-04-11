import 'package:flutter/material.dart';

// class StateManagementDemo extends StatelessWidget {
//   int _count = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('StateManagementDemo'),
//         elevation: 0,
//       ),
//       body: Center(
//         child: Chip(
//           label: Text('$_count'),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _count +=1;
//           print(_count);
//         },
//         child: Icon(Icons.add),
//       ),
//     );
//   }
// }

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;
  void _increaseCount() {
    setState(() {
      _count -= 1;
    });
    print(_count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0,
      ),
      body: CounterWrapper(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _count += 1;
          });

          print(_count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increateCount;
  CounterWrapper(this.count, this.increateCount);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count, increateCount),
    );
  }
}

class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increateCount;
  Counter(this.count, this.increateCount);

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text('$count'),
      onPressed: () {
        increateCount();
      },
    );
  }
}
