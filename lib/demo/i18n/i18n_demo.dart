
import 'package:flutter/material.dart';
import 'package:widght_flutter/demo/i18n/map/localizations_demo.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale locale=Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 4.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('${locale.toString()}'),
            Text(
              LocalizationsDemo.of(context).title,
//              Localizations.of(context, LocalizationsDemo).title,
              style: Theme.of(context).textTheme.title,
            ),
          ],
        ),
      ),
    );
  }
}
