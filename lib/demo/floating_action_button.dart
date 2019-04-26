import 'package:flutter/material.dart';


//悬浮按钮
class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
//    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
  );

  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
    onPressed: () {},
    icon: Icon(Icons.add),
    label: Text('add'),
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0.0))),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
        elevation: 0.0,
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            FlatButton(onPressed: null, child: Icon(Icons.home)),
            FlatButton(onPressed: null, child: Icon(Icons.mail)),
          ],
        ),
        shape: CircularNotchedRectangle(),
      ),
    );
  }
}