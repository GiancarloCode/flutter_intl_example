import 'package:flutter/material.dart';
import 'package:flutter_intl_example/style/theme.dart';
import 'package:flutter_intl_example/widgets/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_intl_example/generated/l10n.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: HomePage(),
      title: 'Flutter Intl Example',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _firstName = 'Giancarlo';

  String _lastName = 'Code';

  int _notifications = 0;

  _resetNotifications() => setState(() => _notifications = 0);

  _incrementNotifications() => setState(() => _notifications++);

  _decrementNotifications() => setState(() {
        if (_notifications > 0) _notifications--;
      });

  @override
  Widget build(BuildContext context) {
    return HomeScaffold(
      cards: <Widget>[
        TextCard(
          text: S.of(context).simpleText,
        ),
        TextCard(
          text: S.of(context).textWithPlaceholder(_firstName),
        ),
        TextCard(
          text: S.of(context).textWithPlaceholders(_firstName, _lastName),
        ),
        NotificationsCard(
          text: S.of(context).textWithPlural(_notifications),
          onReset: _resetNotifications,
          onDecrement: _decrementNotifications,
          onIncrement: _incrementNotifications,
        ),
      ],
    );
  }
}
