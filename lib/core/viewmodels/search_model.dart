import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';

class SearchModel extends BaseModel {

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

  List<Widget> _people = [
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => print('Tapped Avatar'),
        child: CircleAvatar(
          backgroundColor: Colors.black,
          radius: 28.0,
          backgroundImage: AssetImage('assets/people/person_1.jpg'),
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
          backgroundImage: AssetImage('assets/people/person_2.jpg'),
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
          backgroundImage: AssetImage('assets/people/person_3.jpg'),
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
          backgroundImage: AssetImage('assets/people/person_4.jpg'),
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
          backgroundImage: AssetImage('assets/people/person_5.jpg'),
        ),
      ),
    ),
  ];

  bool _pressed = false;

  bool get pressed => _pressed;
  List<Event> get events => _events;
  List<Widget> get people => _people;

  void transition() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }

  //* Route Transitions
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