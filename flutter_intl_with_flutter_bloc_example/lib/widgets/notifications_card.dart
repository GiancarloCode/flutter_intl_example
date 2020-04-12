import 'package:flutter/material.dart';
import 'package:flutter_intl_example/widgets/text_card.dart';

class NotificationsCard extends StatelessWidget {
  const NotificationsCard({
    Key key,
    @required this.text,
    @required this.onReset,
    @required this.onDecrement,
    @required this.onIncrement,
  }) : super(key: key);

  final String text;
  final VoidCallback onReset;
  final VoidCallback onDecrement;
  final VoidCallback onIncrement;

  @override
  Widget build(BuildContext context) {
    return TextCard(
      text: text,
      bottom: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.replay),
            onPressed: onReset,
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: onDecrement,
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: onIncrement,
          ),
        ],
      ),
    );
  }
}
