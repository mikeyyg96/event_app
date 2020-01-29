import 'package:flutter/material.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenPage createState() => _RootScreenPage();
}

class _RootScreenPage extends State<RootScreen> {
  int counter;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset('assets/background/login_background1x.jpg'),
          Container(
            child: Center(
              child: RaisedButton(
                onPressed: () {},
                child: Text('Incremement $counter'),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
