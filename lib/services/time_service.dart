import '../db/database.dart';

class TimeService {
  static Future<Time> getTimeById(int id) async {
    final query = db.select(db.times)..where((c) => c.id.equals(id));
    final result = await query.get();

    return result.first;
  }
}
