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

  void _sort(getField(post),bool ascending){
    _posts.sort((a,b){
        if(!ascending){
          final c=a;
          a=b;
          b=c;
        }
        final aValue=getField(a);
        final bValue=getField(b);
        return Comparable.compare(aValue, bValue);;
    });
    notifyListeners();
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
              rowsPerPage: 5,
              header: Text('Posts'),
              source: _postsDataSource,
              sortColumnIndex: _sortColumnIndex,
              sortAscending: _sortAscending,
              // onSelectAll: (bool value){},
              columns: [
                DataColumn(
                    label: Text('title'),
                    onSort: (int columIndex, bool ascending) {
                      setState(() {
                        _sortAscending = ascending;
                        _sortColumnIndex = columIndex;
                        _postsDataSource._sort((post)=>post.title.length,ascending);
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
