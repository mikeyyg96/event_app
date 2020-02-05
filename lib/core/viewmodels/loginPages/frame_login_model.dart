import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

import 'package:flutter/material.dart';

class FrameLoginModel extends BaseModel {
  final databaseReference = Firestore.instance;

  String _image = 'assets/background/town_background.jpg';

  bool _pressed = false;
  bool _isTransitioned = false;

  String get image => _image;

  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;

  void refreshUI() {
    setState(ViewState.Busy);

    filteredEvents.clear();
    databaseEvents.forEach((Event event) {
      filters.forEach((String filter) {
        if (filter.toLowerCase() == event.category.toLowerCase()) {
          filteredEvents.add(event);
        }
      });
    });
    notifyListeners();

    setState(ViewState.Idle);
  }

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

  Future<List<Event>> getEvents() async {
    // Eventually a parameter would be the preferences to filter
    await databaseReference
        .collection("events")
        .getDocuments()
        .then((QuerySnapshot snapshot) {
      snapshot.documents.forEach((f) {
        databaseEvents.add(new Event(
          category: f.data['category'],
          date: f.data['date'].toString(),
          description: f.data['description'],
          distance: f.data['distance'],
          image: 'https://picsum.photos/seed/picsum/200/300',
          name: f.data['name'],
          organization: f.data['organization'],
          price: f.data['price'],
        ));
        //f.data.length;
        //tempMap.addAll(f.data);
      });
    });
    //print(tempMap.length);
    // tempMap.forEach((field, value) {
    //   databaseEvents.add(new Event(
    //     category: tempMap['category'],
    //     date: tempMap['date'].toString(),
    //     description: tempMap['description'],
    //     distance: tempMap['distance'],
    //     image: 'assets/events/burger_food.jpg',
    //     name: tempMap['name'],
    //     organization: tempMap['organization'],
    //     price: tempMap['price'],
    //   ));
    // });
    return databaseEvents;
  }

  //* Route transition functions
  Route searchRoute(Object view, Offset offset) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => view,
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = offset;
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
