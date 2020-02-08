import 'package:event_app/core/classes/event.dart';
import 'package:event_app/core/enums/viewstate.dart';
import 'package:event_app/core/viewmodels/base_model.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:event_app/core/classes/earnings.dart';
import 'package:event_app/ui/views/contentPages/event_details_view.dart';
import 'package:flutter/material.dart';

class ProfileModel extends BaseModel {

  List<Earnings> data = [
    Earnings(
      month: 'Jan',
      earnings: 12.73,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFAF9164))
    ),
    Earnings(
      month: 'Feb',
      earnings: 38.58,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFAF9164))
    ),
    Earnings(
      month: 'Mar',
      earnings: 116.92,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFAF9164))
    ),
    Earnings(
      month: 'Apr',
      earnings: 243.04,
      barColor: charts.ColorUtil.fromDartColor(Color(0xFFAF9164))
    ),
  ];

  int _currentIndex = 1;

  int get currentIndex => _currentIndex;

  void switchPage(int index) {
    setState(ViewState.Busy);

    _currentIndex = index;
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