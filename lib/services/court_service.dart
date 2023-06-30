import '../db/database.dart';

class CourtMetadata {
  CourtMetadata(
      {required this.label, required this.courtId, required this.timeId});

  String label;
  int courtId;
  int timeId;
}

class CourtService {
  static Future<Court> getCourtById(int id) async {
    final query = db.select(db.courts)..where((c) => c.id.equals(id));
    final result = await query.get();

    return result.first;
  }

  static Future<List<CourtMetadata>> getAvailableCourts(DateTime date) async {
    const courtLabel = 'Cancha';
    List<CourtMetadata> courts = [];

    final allCourts = await db.select(db.courts).get();
    final allTimes = await db.select(db.times).get();
    final schedules = await (db.select(db.schedules)
          ..where((s) => s.date.equals(date)))
        .get();

    for (var court in allCourts) {
      for (var time in allTimes) {
        if (!schedules.any((s) => s.court == court.id && s.time == time.id)) {
          courts.add(CourtMetadata(
              label: "$courtLabel ${court.name} | ${time.hours}",
              courtId: court.id,
              timeId: time.id));
        }
      }
    }

    return courts;
  }
}
