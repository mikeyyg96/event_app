import 'package:event_app/core/viewmodels/loginPages/frame_login_model.dart';
import 'package:event_app/ui/views/base_view.dart';
import 'package:flutter/material.dart';

class FrameLoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<FrameLoginModel>(
      builder: (context, model, child) => Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/background/town_background.jpg'),
                  fit: BoxFit.fill),
            ),
          ),
          AnimatedPositioned(
            curve: Curves.easeIn,
            duration: Duration(milliseconds: 500),
            bottom:
                model.pressed ? -100 : MediaQuery.of(context).size.height / 6,
            left: 125,
            child: Material(
              color: Theme.of(context).primaryColor.withOpacity(0.5),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                onTap: () {
                  model.transition();
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  width: MediaQuery.of(context).size.width / 2.2,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text('Explore',
                            style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 32)),
                      ),
                      Icon(
                        Icons.place,
                        color: Theme.of(context).accentColor,
                        size: 32,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
