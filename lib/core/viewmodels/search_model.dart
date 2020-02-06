import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';

class SearchModel extends BaseModel {
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

  TextEditingController _controller = new TextEditingController();

  bool _pressed = false;

  TextEditingController get controller => _controller;

  bool get pressed => _pressed;

  List<Widget> get people => _people;

  void transition() {
    setState(ViewState.Busy);

    _pressed = true;
    notifyListeners();

    setState(ViewState.Idle);
  }

  void changeText(String value) {
    setState(ViewState.Busy);

    _controller.value = _controller.value.copyWith(text: value);
    notifyListeners();

    setState(ViewState.Idle);
  }

  Route eventDetailsRoute(event) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          EventDetailsView(event: event),
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
