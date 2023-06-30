import 'package:cancha_tenis/services/schedule_service.dart';
import 'package:flutter/foundation.dart';

import '../models/create_schedule.dart';
import '../models/full_schedule.dart';

class AppState extends ChangeNotifier {
  AppState() {
    _setSchedules();
  }

  List<FullSchedule>? _schedules;

  List<FullSchedule>? get schedules => _schedules;

  void _setSchedules() async {
    _schedules = await ScheduleService.getSchedules();
    notifyListeners();
  }

  void addSchedule(CreateSchedule newSchedule) async {
    await ScheduleService.createSchedule(newSchedule);
    _setSchedules();
  }

  void deleteSchedule(int id) async {
    await ScheduleService.deleteScheduleById(id);
    _setSchedules();
  }
}
