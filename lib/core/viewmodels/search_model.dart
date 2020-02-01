import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:flutter/material.dart';
import 'package:event_app/ui/shared/styling.dart';

class SearchModel extends BaseModel {
  List<Widget> _places = [
    Container(
      height: 25,
      width: 160,
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
    Container(
      height: 25,
      width: 160,
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
      width: 160,
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
      width: 160,
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
      width: 160,
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
      width: 160,
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

  List<Widget> _people = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 28.0,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 28.0,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 28.0,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 28.0,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.grey,
          radius: 28.0,
          child: Icon(
            Icons.person,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ];

  bool _pressed = false;

  bool get pressed => _pressed;
  List<Widget> get places => _places;
  List<Widget> get people => _people;

  void transition() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }
}
