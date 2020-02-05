import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';

import 'package:event_app/ui/views/widget_views/content_card_view.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';

import 'package:flutter/material.dart';

//* Import files for routes transitions
import 'package:event_app/ui/views/search_view.dart';

// Data
import 'package:event_app/core/data/events.dart';

class FrameLoginModel extends BaseModel {

  String _image = 'assets/background/town_background.jpg';

  bool _pressed = false;
  bool _isTransitioned = false;

  String get image => _image;

  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;

  void refreshUI() {
    setState(ViewState.Busy);

    filteredEvents.clear();
    events.forEach((Event event) {
      filters.forEach((String filter) {
        if (filter == event.category) {
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

  Route eventDetailsRoute(event) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => EventDetailsView(event: event),
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
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
