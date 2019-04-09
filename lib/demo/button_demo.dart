import 'package:flutter/material.dart';


class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('FlatButton'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.blue,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButton'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.blue,
        ),
      ],
    );
    final Widget raisedButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.accent,
                  // shape: BeveledRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10)
                  // )
                  shape: StadiumBorder())),
          child: RaisedButton(
            child: Text('FlatButton'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Colors.white,
            // color: Colors.cyan,
            elevation: 0.0,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButton'),
          onPressed: () {},
          elevation: 12.0,
          splashColor: Colors.grey,
          textColor: Colors.blue,
        ),
      ],
    );
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              buttonTheme: ButtonThemeData(
                  textTheme: ButtonTextTheme.accent,
                  // shape: BeveledRectangleBorder(
                  //   borderRadius: BorderRadius.circular(10)
                  // )
                  shape: StadiumBorder())),
          child: OutlineButton(
            child: Text('FlatButton'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
            // color: Colors.cyan,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('FlatButton'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.blue,
        ),
      ],
    );
    final Widget fiexdWidghtButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget expandedButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        ),
        SizedBox(
          width: 16.0,
        ),
        Expanded(
          flex: 2,
          child: OutlineButton(
            child: Text('Button'),
            onPressed: () {},
            splashColor: Colors.grey[100],
            borderSide: BorderSide(color: Colors.black),
            textColor: Colors.black,
            highlightedBorderColor: Colors.grey,
          ),
        )
      ],
    );
    final Widget buttonBarDemo= Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Theme(
                  data: Theme.of(context).copyWith(
                    buttonTheme: ButtonThemeData(
                        padding: EdgeInsets.symmetric(horizontal: 33.0)),
                  ),
                  child: ButtonBar(
                    children: <Widget>[
                      OutlineButton(
                        child: Text('Button'),
                        onPressed: () {},
                        splashColor: Colors.grey[100],
                        borderSide: BorderSide(color: Colors.black),
                        textColor: Colors.black,
                        highlightedBorderColor: Colors.grey,
                      ),
                      OutlineButton(
                        child: Text('Button'),
                        onPressed: () {},
                        splashColor: Colors.grey[100],
                        borderSide: BorderSide(color: Colors.black),
                        textColor: Colors.black,
                        highlightedBorderColor: Colors.grey,
                      ),
                    ],
                  ),
                )
              ],
            );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           flatButtonDemo,
           raisedButtonDemo,
           outlineButtonDemo,
           fiexdWidghtButtonDemo,
           expandedButton,
           buttonBarDemo
          ],
        ),
      ),
    );
  }
}