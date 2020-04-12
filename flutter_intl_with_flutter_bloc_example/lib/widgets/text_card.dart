import 'package:flutter/material.dart';
import 'package:flutter_intl_example/style/constants.dart';

class TextCard extends StatelessWidget {
  const TextCard({
    Key key,
    @required this.text,
    this.bottom,
  }) : super(key: key);

  final String text;
  final Widget bottom;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6.0),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            width: constraints.maxWidth >= kCardMaxWidth
                ? kCardMaxWidth
                : constraints.maxWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  text,
                  style: TextStyle(fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                if (bottom != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 12.0, bottom: 2.0),
                    child: bottom,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
