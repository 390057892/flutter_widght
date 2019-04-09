import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  List<String> _tags = ['Apple', 'Banana', 'Lemon', 'Pip'];
  String _action = 'Nothing';
  List<String> _selected = [];
  String _choice = 'Lemon';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 16.0,
              runSpacing: 8.0,
              children: <Widget>[
                Chip(
                  label: Text('label A'),
                ),
                Chip(
                  label: Text(
                    'label B',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text(
                    'label C',
                    style: TextStyle(color: Colors.white),
                  ),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('赵'),
                  ),
                ),
                Chip(
                  label: Text(
                    'label D',
                    style: TextStyle(color: Colors.white),
                  ),
                  avatar: CircleAvatar(
                    backgroundImage: NetworkImage(
                        'https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553619675767&di=49d3918b21879df6d8c0102087fa2139&imgtype=0&src=http%3A%2F%2Fimage.yy.com%2Fyywebalbumbs2bucket%2F23b7ba35078a4505bc2bec90940a80e0_1487720650500.jpg'),
                  ),
                ),
                Chip(
                  label: Text('City'),
                  onDeleted: () {},
                  deleteIcon: Icon(Icons.delete),
                  deleteIconColor: Colors.blue,
                  deleteButtonTooltipMessage: 'Remove this tag',
                ),
                Divider(
                  color: Colors.green,
                  height: 32.0,
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return Chip(
                      label: Text(tag),
                      onDeleted: () {
                        setState(() {
                          _tags.remove(tag);
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.green,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ActionChip $_action'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ActionChip(
                      label: Text(tag),
                      onPressed: () {
                        setState(() {
                          _action = tag;
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.green,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('FilterChip ${_selected.toString()}'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return FilterChip(
                      label: Text(tag),
                      selected: _selected.contains(tag),
                      onSelected: (value) {
                        setState(() {
                          if (_selected.contains(tag)) {
                            _selected.remove(tag);
                          } else {
                            _selected.add(tag);
                          }
                        });
                      },
                    );
                  }).toList(),
                ),
                Divider(
                  color: Colors.green,
                  height: 32.0,
                ),
                Container(
                  width: double.infinity,
                  child: Text('ChoiceChip $_choice'),
                ),
                Wrap(
                  spacing: 8.0,
                  children: _tags.map((tag) {
                    return ChoiceChip(
                      label: Text(tag),
                      selected: _choice == tag,
                      onSelected: (value) {
                        setState(() {
                          _choice = tag;
                        });
                      },
                    );
                  }).toList(),
                )
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.restore),
        onPressed: () {
          setState(() {
            _tags = ['Apple', 'Banana', 'Lemon', 'Pip'];
            _selected = [];
            _choice = 'Lemon';
          });
        },
      ),
    );
  }
}
