import 'package:flutter/material.dart';
import '../model/post.dart';

class DataTableDemo extends StatefulWidget {
  @override
  _DataTableDemoState createState() => _DataTableDemoState();
}

class _DataTableDemoState extends State<DataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

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
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (bool value){},
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int index, bool ascending) {
                      setState(() {
                        _sortAscending = ascending;
                        _sortColumnIndex = index;
                        posts.sort((a, b) {
                          if (!ascending) {
                            final c = a;
                            a = b;
                            b = c;
                          }
                          return a.title.length.compareTo(b.title.length);
                        });
                      });
                    }),
                DataColumn(label: Text('author')),
                DataColumn(label: Text('image')),
              ],
              rows: posts.map((post) {
                return DataRow(
                    selected: post.selected,
                    onSelectChanged: (bool value) {
                      setState(() {
                        if (post.selected != value) {
                          post.selected = value;
                        }
                      });
                    },
                    cells: [
                      DataCell(Text(post.title)),
                      DataCell(Text(post.author)),
                      DataCell(Image.network(post.imageUrl)),
                    ]);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
