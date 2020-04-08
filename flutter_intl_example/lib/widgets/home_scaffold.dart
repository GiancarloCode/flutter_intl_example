import 'package:flutter/material.dart';
import 'package:flutter_intl_example/style/constants.dart';

class HomeScaffold extends StatelessWidget {
  const HomeScaffold({
    Key key,
    @required this.cards,
  }) : super(key: key);

  final List<Widget> cards;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kScaffoldBackgroundGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 24.0,
                  horizontal: 16.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: cards,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
