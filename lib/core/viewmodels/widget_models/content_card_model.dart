import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';

class ContentCardModel extends BaseModel {
  
  void refreshUI() {
    setState(ViewState.Busy);

    notifyListeners();

    setState(ViewState.Idle);
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
