import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatefulWidget {
  @override
  _StreamDemoState createState() => _StreamDemoState();
}

class _StreamDemoState extends State<StreamDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 4.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  StreamSubscription _streamSubscription;
  StreamController<String> _streamDemo;
  StreamSink _streamSinkDemo;
  String _data = '....';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('create steram');
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());
    _streamDemo = StreamController.broadcast();
    _streamSinkDemo = _streamDemo.sink;
    print('start listen');
    _streamSubscription =
        _streamDemo.stream.listen(onData, onError: onError, onDone: onDone);
    _streamDemo.stream.listen(onDataTwo, onError: onError, onDone: onDone);
    print('Initialize completed');
  }

  void onDone() {
    print('done');
  }

  void onError(error) {
    print('Error: $error');
  }

  void onData(String data) {
    setState(() {
      _data = data;
    });
    print('$data');
  }

  void onDataTwo(String data) {
    print('two: $data');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'http 404';
    return 'hello~';
  }

  void _pauseStream() {
    print('stream pause');
    _streamSubscription.pause();
  }

  void _resumeStream() {
    print('stream resume');
    _streamSubscription.resume();
  }

  void _cancelStream() {
    print('stream cancel');
    _streamSubscription.cancel();
  }

  void _addDataToStream() async {
    print('Add data to Stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _streamSinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text('$_data'),
            StreamBuilder(
                stream: _streamDemo.stream,
                initialData: '...',
                builder: (context, snapshot) {
                  return Text(snapshot.data);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('cancel'),
                  onPressed: _cancelStream,
                ),
                FlatButton(
                  child: Text('add'),
                  onPressed: _addDataToStream,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
