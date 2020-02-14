
class User {
  String name, type, participated, hosted, rewardPoints;
  List<dynamic> reserved, interested, past;

  set setName(String name) {
    this.name = name;
  }

  User(
      {this.name,
      this.type,
      this.participated,
      this.hosted,
      this.rewardPoints, this.reserved, this.interested, this.past});

}
