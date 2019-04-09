import 'package:flutter/material.dart';
import 'package:widght_flutter/demo/chip_demo.dart';
import 'package:widght_flutter/demo/expansion_panel_demo.dart';
import '../demo/button_demo.dart';
import '../demo/floating_action_button.dart';
import '../demo/popup_menu_button.dart';
import '../demo/form_demo.dart';
import '../demo/checkbox_demo.dart';
import '../demo/radio_demo.dart';
import '../demo/switch_demo.dart';
import '../demo/slider_demo.dart';
import '../demo/datetime_demo.dart';
import '../demo/simple_dialog_demo.dart';
import 'alter_dialog_demo.dart';
import 'bottom_sheet_demo.dart';
import 'snack_bar_demo.dart';
import 'data_table_demo.dart';

class MatericalComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MatericalComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(title: 'SliderDemo', page: SliderDemo()),
          ListItem(title: 'SimpleDialogDemo', page: SimpleDialogDemo()),
          ListItem(title: 'AlterDialogDemo', page: AlterDialogDemo()),
          ListItem(title: 'BottomSheetDemo', page: BottomSheetDemo()),
          ListItem(title: 'SnackBarDemo', page: SnackBarDemo()),
          ListItem(title: 'ExpansionPanelDemo', page: ExpansionPanelDemo()),
          ListItem(title: 'ChipDemo', page: ChipDemo()),
          ListItem(title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'PopupMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'FormDemo', page: FormDemo()),
          ListItem(title: 'CheckboxDemo', page: CheckboxDemo()),
          ListItem(title: 'RadioDemo', page: RadioDemo()),
          ListItem(title: 'SwitchDemo', page: SwitchDemo()),
          ListItem(title: 'DateTimeDemo', page: DateTimeDemo()),
          ListItem(title: 'DataTableDemo', page: DataTableDemo()),
        ],
      ),
    );
  }
}

class _WidghtDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('_WidghtDemo'),
        elevation: 4.0,
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({
    this.title,
    this.page,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
