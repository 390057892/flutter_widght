import 'package:flutter/material.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DataTableDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            DataTable(
              columns: [
                DataColumn(
                  label: Text('title')
                ),DataColumn(
                  label: Text('author')
                ),DataColumn(
                  label: Text('title')
                ),DataColumn(
                  label: Text('title')
                ),DataColumn(
                  label: Text('title')
                ),DataColumn(
                  label: Text('title')
                )
              ],
              rows: [
                DataRow(
                  cells: [
                    DataCell(Text('hello')),
                    DataCell(Text('hello')),
                    DataCell(Text('hello')),
                    DataCell(Text('hello')),
                    DataCell(Text('hello')),
                    DataCell(Text('hello')),
                  ]
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}