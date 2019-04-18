import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
class RxDartDemo extends StatefulWidget {
  @override
  _RxDartDemoState createState() => _RxDartDemoState();
}

class _RxDartDemoState extends State<RxDartDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDart'),
        elevation: 4.0,
      ),
      body: RxDartDemoHome(),
    );
  }
}


class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  PublishSubject<String> _textFieldSubject;
  @override
  void initState() {
    super.initState();
    _textFieldSubject=PublishSubject<String>();

    _textFieldSubject
      // .map((item)=>'item: $item')
      .where((item)=>item.length>9)
      .debounce(Duration(milliseconds: 500))
      .listen((data)=>print('$data'));

    // _textFieldSubject.close();
    // Observable<String> _observable=
    //           // Observable(Stream.fromIterable(['hello','你好']));
    //           // Observable.fromFuture(Future.value('hello~'));
    //           // Observable.fromIterable(['aaa','bbb']);
    //             //  Observable.just('hello!');
    //             Observable.periodic(Duration(seconds: 1),(x)=>x.toString());
    // _observable.listen(print);

    // PublishSubject<String> _subject=PublishSubject<String>();

    // BehaviorSubject<String> _subject=BehaviorSubject<String>();
    // ReplaySubject<String> _subject=ReplaySubject<String>(maxSize: 2);
    // _subject.add('hello');
    // _subject.add('qwer');
    // _subject.add('wert');
    // _subject.listen((data)=>print('listen1 : $data'));
    // // _subject.add('heaaa');
    // _subject.listen((data)=>print('listen2 : ${data.toUpperCase()}'));
    // // _subject.add('qwer');

    // _subject.close();
  }

  @override
  void dispose() {
    _textFieldSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,

      ),
      child: TextField(
        onChanged: (value){
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value){
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'title',
          filled: true
        ),
      ),
    );
  }
}