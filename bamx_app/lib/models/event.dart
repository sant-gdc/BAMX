class Event {
  int id;
  String title;
  String type;
  String img;
  String details;
  String location;
  DateTime date;
  int points;
  int volunteers;
  int enrolled;

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
  });
}
