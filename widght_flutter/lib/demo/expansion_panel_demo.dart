import 'package:flutter/material.dart';

class ExpansionPanelItem {
  final String headText;
  final Widget body;
  bool isExpanded;

  ExpansionPanelItem({this.headText, this.body, this.isExpanded});
}

class ExpansionPanelDemo extends StatefulWidget {
  @override
  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
  List<ExpansionPanelItem> _expansionPanelItems;

  @override
  void initState() {
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
          headText: 'Panel A',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content detail for A'),
          ),
          isExpanded: true),
      ExpansionPanelItem(
          headText: 'Panel B',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content detail for B'),
          ),
          isExpanded: false),
      ExpansionPanelItem(
          headText: 'Panel C',
          body: Container(
            padding: EdgeInsets.all(16.0),
            width: double.infinity,
            child: Text('Content detail for C'),
          ),
          isExpanded: false),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ExpansionPanelDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int pancelIndex, bool isExpanded) {
                setState(() {
                  _expansionPanelItems[pancelIndex].isExpanded = !isExpanded;
                });
              },
              children: _expansionPanelItems.map((ExpansionPanelItem item) {
                return ExpansionPanel(
                    isExpanded: item.isExpanded,
                    body: item.body,
                    headerBuilder: (context, _isExpanded) {
                      return Container(
                        padding: EdgeInsets.all(16.0),
                        child: Text(item.headText,
                            style: Theme.of(context).textTheme.title),
                      );
                    });
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
