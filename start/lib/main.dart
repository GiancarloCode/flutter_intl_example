import 'package:flutter/material.dart';
import 'package:flutter_intl_example/style/theme.dart';
import 'package:flutter_intl_example/widgets/widgets.dart';

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
          text: 'Hello world',
        ),
        TextCard(
          text: 'Welcome $_firstName',
        ),
        TextCard(
          text: 'My name is $_lastName, $_firstName $_lastName',
        ),
        NotificationsCard(
          text: 'You have $_notifications notifications',
          onReset: _resetNotifications,
          onDecrement: _decrementNotifications,
          onIncrement: _incrementNotifications,
        ),
      ],
    );
  }
}
