import 'package:event_app/core/classes/category.dart';
import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/data/placeholders.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/widget_views/content_card_view.dart';
import 'package:event_app/ui/views/widget_views/content_category_view.dart';
import 'package:flutter/material.dart';

//* Import files for routes transitions
import 'package:event_app/ui/views/search_view.dart';

class FrameLoginModel extends BaseModel {
  // Temporary

  List<Event> _events = [
    Event(
        name: 'Burger Fridays',
        category: 'Food',
        date: DateTime.now(),
        distance: 2.12,
        image: 'assets/events/burger_food.jpg',
        organization: 'Verified',
        price: 15.00),
    Event(
        name: 'Beach Activities',
        category: 'Outdoor',
        date: DateTime.now(),
        distance: 49.33,
        image: 'assets/events/beach.jpg',
        organization: 'Verified',
        price: 5.00),
    Event(
        name: 'H20 Hookah Lounge',
        category: 'Club',
        date: DateTime.now(),
        distance: 21.39,
        image: 'assets/events/concert.jpg',
        organization: 'Sponsored',
        price: 40.00),
    Event(
        name: 'Gaming Competition',
        category: 'Gaming',
        date: DateTime.now(),
        distance: 16.70,
        image: 'assets/events/gaming.jpg',
        organization: 'Verified',
        price: 20.00),
    Event(
        name: 'Group Jogging',
        category: 'Exercise',
        date: DateTime.now(),
        distance: 1.27,
        image: 'assets/events/jogging.jpg',
        organization: 'Non-Trusted',
        price: 0.00),
    Event(
        name: 'Sight Seeing',
        category: 'Outdoors',
        date: DateTime.now(),
        distance: 10.93,
        image: 'assets/events/sight_seeing.jpg',
        organization: 'Verified',
        price: 35.00),
    Event(
        name: 'Wine Tasting',
        category: 'Food',
        date: DateTime.now(),
        distance: 2.12,
        image: 'assets/events/wine.jpg',
        organization: 'Sponsored',
        price: 40.00),
  ];

  var _places = [
    Category(category: 'Food', counter: 6, iconData: Icons.restaurant),
    Category(category: 'Culture', counter: 1, iconData: Icons.group),
    Category(category: 'History', counter: 4, iconData: Icons.history),
    Category(category: 'Club', counter: 3, iconData: Icons.local_bar),
    Category(category: 'Outdoor', counter: 2, iconData: Icons.local_activity),
    Category(category: 'Gaming', counter: 0, iconData: Icons.gamepad),
  ];

  ContentCardView _card = ContentCardView();
  String _image = 'assets/background/town_background.jpg';

  bool _pressed = false;
  bool _isTransitioned = false;

  List<Event> get events => _events;
  ContentCardView get card => _card;
  String get image => _image;
  bool get pressed => _pressed;
  bool get isTransitioned => _isTransitioned;
  List<Category> get places => _places;

  void refreshUI() {
    setState(ViewState.Busy);

    filteredEvents.clear();
    _events.forEach((Event event) {
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
  Route searchRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SearchView(),
      transitionDuration: const Duration(milliseconds: 1000),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
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
