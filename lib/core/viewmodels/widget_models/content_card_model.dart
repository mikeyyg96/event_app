import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';
import 'package:event_app/core/data/placeholders.dart';

class ContentCardModel extends BaseModel {
  bool _active = false;
  bool get active => _active;

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

  void activate(String filter, int index) {
    setState(ViewState.Busy);

    filterCards[index] = true;
    filters.add(filter);
    notifyListeners();
    setState(ViewState.Idle);
  }

  void deactivate(String filter, int index) {
    setState(ViewState.Busy);

    filterCards[index] = false;
    filters.remove(filter);
    notifyListeners();

    setState(ViewState.Idle);
  }

  Route eventDetailsRoute(Event event) {
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
