class FullSchedule {
  FullSchedule(
      {required this.id,
      required this.court,
      required this.time,
      required this.date,
      required this.username,
      required this.precipitation});

  int id;
  String court;
  String time;
  DateTime date;
  String username;
  int? precipitation;
}
