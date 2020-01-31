import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';

class SearchModel extends BaseModel {

var _places = [
    Container(
      height: 25,
      width: 140,
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
      height: 25,
      width: 140,
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
      height: 25,
      width: 140,
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
      height: 25,
      width: 140,
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
      height: 25,
      width: 140,
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
      height: 25,
      width: 140,
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

  bool _pressed = false;

  bool get pressed => _pressed;
  List<Container> get places => _places;

  void transition() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }



}