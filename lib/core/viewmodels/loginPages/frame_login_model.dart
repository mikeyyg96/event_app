import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:flutter/material.dart';

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
              Icon(Icons.restaurant, color: Colors.black54,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Food', style: TextStyle(color: Colors.black54, fontSize: 22, fontWeight: FontWeight.bold),),
              ),
              Text('6x', style: TextStyle(color: Colors.black54, fontSize: 16.0),)
            ],
          )
        ),
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
              Icon(Icons.restaurant, color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Culture', style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              Text('6x', style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          )
        ),
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
              Icon(Icons.restaurant, color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('History', style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              Text('6x', style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          )
        ),
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
              Icon(Icons.restaurant, color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Clubs', style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              Text('6x', style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          )
        ),
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
              Icon(Icons.restaurant, color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Outdoors', style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              Text('6x', style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          )
        ),
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
              Icon(Icons.restaurant, color: Colors.white,),
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text('Food', style: TextStyle(color: Colors.white, fontSize: 22),),
              ),
              Text('6x', style: TextStyle(color: Colors.white, fontSize: 16.0),)
            ],
          )
        ),
      ),
    ),
  ];

  bool _pressed = false;
  bool _isTransitioned = false;

  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;
  List<Container> get places => _places;

  void animateDown() {
    setState(ViewState.Busy);

    _pressed = true;
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
