import 'package:flutter/material.dart';
import '../model/post.dart';

class PostDataSource extends DataTableSource{
  final List<Post> _posts=posts;
  int _selectCount=0;
  @override
  int get rowCount => _posts.length;
  @override
  bool get isRowCountApproximate => false;
  
  @override
  int get selectedRowCount => _selectCount;

  @override
  DataRow getRow(int index) {
    final Post post=_posts[index];
    return DataRow.byIndex(
      index: index,
      cells: <DataCell>[
        DataCell(Text(post.title)),
        DataCell(Text(post.author)),
        DataCell(Container(width: 30.0,child: Image.network(post.imageUrl),)),
        DataCell(Text(post.description)),
      ]
    );
  }
}

class PaginatedDataTableDemo extends StatefulWidget {
  @override
  _PaginatedDataTableDemoState createState() => _PaginatedDataTableDemoState();
}

class _PaginatedDataTableDemoState extends State<PaginatedDataTableDemo> {
  int _sortColumnIndex = 0;
  bool _sortAscending = true;
  final PostDataSource _postsDataSource=PostDataSource();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PaginatedDataTableDemo'),
        elevation: 4.0,
      ),
      body: Container(
        // padding: EdgeInsets.all(10.0),
        child: ListView(
          children: <Widget>[
            PaginatedDataTable(
              // rowsPerPage: posts.length,
              header: Text('Posts'),
              source: _postsDataSource,
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
                 DataColumn(label: Text('description')),
              ],
              
            )
          ],
        ),
      ),
    );
  }
}
