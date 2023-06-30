import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at
// first, but it's needed for drift to know about the generated code
part 'database.g.dart';

// this will generate a table called "courts" for us. The rows of that table will
// be represented by a class called "Court". And so on...
class Courts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class Times extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get hours => text()();
}

class Schedules extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get court => integer().references(Courts, #id)();
  IntColumn get time => integer().references(Times, #id)();
  DateTimeColumn get date => dateTime()();
  TextColumn get username => text()();
}

@DriftDatabase(tables: [Courts, Times, Schedules])
class MyDatabase extends _$MyDatabase {
  // we tell the database where to store the data with this constructor
  MyDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  @override
  int get schemaVersion => 1;
}

final MyDatabase db = MyDatabase();

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase.createInBackground(file);
  });
}

// so you can generate all the code needed with 'dart run build_runner build'
