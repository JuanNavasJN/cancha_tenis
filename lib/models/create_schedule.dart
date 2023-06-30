final class CreateSchedule {
  const CreateSchedule(
      {required this.courtId,
      required this.timeId,
      required this.date,
      required this.username});

  final int courtId;
  final int timeId;
  final DateTime date;
  final String username;
}
