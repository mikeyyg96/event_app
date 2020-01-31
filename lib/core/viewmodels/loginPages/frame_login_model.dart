import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/widget_views/content_card_view.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';

class FrameLoginModel extends BaseModel {
  // Temporary
  var _places = [
    Container(
      width: 100,
      child: Card(
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.restaurant,
              color: Colors.black54,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Food',
                style: stylingActiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingActiveCardNum,
            )
          ],
        )),
      ),
    ),
    Container(
      width: 100,
      child: Card(
        color: Colors.black38,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.public,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Culture',
                style: stylingInactiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingInactiveCardNum,
            )
          ],
        )),
      ),
    ),
    Container(
      width: 100,
      child: Card(
        color: Colors.black38,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.schedule,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'History',
                style: stylingInactiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingInactiveCardNum,
            )
          ],
        )),
      ),
    ),
    Container(
      width: 100,
      child: Card(
        color: Colors.black38,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.local_bar,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Clubs',
                style: stylingInactiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingInactiveCardNum,
            )
          ],
        )),
      ),
    ),
    Container(
      width: 100,
      child: Card(
        color: Colors.black38,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.restaurant,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Outdoors',
                style: stylingInactiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingInactiveCardNum,
            )
          ],
        )),
      ),
    ),
    Container(
      width: 100,
      child: Card(
        color: Colors.black38,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Icon(
              Icons.restaurant,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Food',
                style: stylingInactiveCard,
              ),
            ),
            Text(
              '6x',
              style: stylingInactiveCardNum,
            )
          ],
        )),
      ),
    ),
  ];

  ContentCardView _card = ContentCardView();
  String _image = 'assets/background/town_background.jpg';

  bool _pressed = false;
  bool _isTransitioned = false;

  ContentCardView get card => _card;
  String get image => _image;
  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;
  List<Container> get places => _places;

  void animateDown() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void animateUp() {
    setState(ViewState.Busy);

    _pressed = false;
    _isTransitioned = false;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void transition() {
    setState(ViewState.Busy);

    _isTransitioned = true;
    notifyListeners();

    setState(ViewState.Idle);
  }
}
