import 'package:charts_flutter/flutter.dart' as charts;

class Earnings {
  final String month;
  final double earnings;
  final charts.Color barColor;

  Earnings({this.month, this.earnings, this.barColor});
}