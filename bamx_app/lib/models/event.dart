class Event {
  String id;
  String title;
  String type;
  String img;
  String details;
  String location;
  DateTime date;
  int points;
  int volunteers;
  int enrolled = 0;
  List<Object> users = [];

  Event({
    required this.id,
    required this.title,
    required this.type,
    required this.img,
    required this.details,
    required this.location,
    required this.date,
    required this.points,
    required this.volunteers,
    required this.enrolled,
    required this.users,
  });
}
