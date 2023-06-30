import 'database.dart';

Future<void> initializeDb() async {
  final allCourts = await db.select(db.courts).get();
  final allTimes = await db.select(db.times).get();

  if (allCourts.isEmpty) {
    await db.into(db.courts).insert(CourtsCompanion.insert(name: 'A'));
    await db.into(db.courts).insert(CourtsCompanion.insert(name: 'B'));
    await db.into(db.courts).insert(CourtsCompanion.insert(name: 'C'));
  }

  if (allTimes.isEmpty) {
    await db.into(db.times).insert(TimesCompanion.insert(hours: '9-12'));
    await db.into(db.times).insert(TimesCompanion.insert(hours: '13-16'));
    await db.into(db.times).insert(TimesCompanion.insert(hours: '17-20'));
  }
}
