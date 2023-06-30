import 'package:cancha_tenis/services/court_service.dart';
import 'package:cancha_tenis/services/forecast_service.dart';
import 'package:cancha_tenis/services/time_service.dart';
import 'package:drift/drift.dart';

import '../models/create_schedule.dart';
import '../models/full_schedule.dart';

import '../db/database.dart';

class ScheduleService {
  static Future<void> createSchedule(CreateSchedule newSchedule) async {
    await db.into(db.schedules).insert(SchedulesCompanion.insert(
        court: newSchedule.courtId,
        time: newSchedule.timeId,
        date: newSchedule.date,
        username: newSchedule.username));
  }

  static Future<List<FullSchedule>> getSchedules() async {
    final schedules = (await (db.select(db.schedules)
              ..orderBy([
                (s) => OrderingTerm(expression: s.date, mode: OrderingMode.asc)
              ]))
            .get())
        .toList();

    List<FullSchedule> fullSchedules = [];

    for (var s in schedules) {
      Court court = await CourtService.getCourtById(s.court);
      Time time = await TimeService.getTimeById(s.time);
      int precipitation =
          await ForecastService.getPricipitationProbabilityMax(s.date);

      fullSchedules.add(FullSchedule(
          id: s.id,
          court: court.name,
          time: time.hours,
          date: s.date,
          username: s.username,
          precipitation: precipitation));
    }

    return fullSchedules;
  }

  static Future<int> deleteScheduleById(int id) async {
    final query = db.delete(db.schedules)..where((s) => s.id.equals(id));
    return await query.go();
  }
}
