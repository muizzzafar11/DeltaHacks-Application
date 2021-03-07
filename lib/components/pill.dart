import '../googleauth.dart';

class Pill {
  final int pillsLeft;
  String name;
  List<int> schedule;

  Pill({this.pillsLeft, this.schedule, this.name});

  String toString() {
    return this.name;
  }
}

List<Pill> listOfPills = [];

// List<Pill> listOfPills = [
//   Pill(name: "pill1", schedule: [1, 0, 1, 2, 0, 1, 0], pillsLeft: 7),
//   Pill(name: "pill2", schedule: [1, 0, 1, 2, 0, 1, 0], pillsLeft: 20),
//   Pill(name: "pill3", schedule: [1, 0, 1, 2, 0, 1, 0], pillsLeft: 7),
//   Pill(name: "pill4", schedule: [1, 0, 1, 2, 0, 1, 0], pillsLeft: 20),
// ];
