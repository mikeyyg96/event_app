
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
