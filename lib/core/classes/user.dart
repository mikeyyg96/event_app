import 'package:event_app/core/classes/event.dart';

class User {
  final String name, type, participated, hosted, rewardPoints;
  final List<dynamic> reserved, interested, past;

  User(
      {this.name,
      this.type,
      this.participated,
      this.hosted,
      this.rewardPoints, this.reserved, this.interested, this.past});
}
