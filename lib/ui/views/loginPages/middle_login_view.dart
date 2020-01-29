import 'package:event_app/core/viewmodels/loginPages/middle_login_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class MiddleLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<MiddleLoginModel>(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Image.asset('assets/background/login_background1x.jpg'),
            Container(
              child: Center(
                child: RaisedButton(
                  onPressed: () {model.increment();},
                  child: Text('Incremement ${model.counter}'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
