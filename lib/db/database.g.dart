// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CourtsTable extends Courts with TableInfo<$CourtsTable, Court> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CourtsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? 'courts';
  @override
  String get actualTableName => 'courts';
  @override
  VerificationContext validateIntegrity(Insertable<Court> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Court map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Court(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $CourtsTable createAlias(String alias) {
    return $CourtsTable(attachedDatabase, alias);
  }
}

class Court extends DataClass implements Insertable<Court> {
  final int id;
  final String name;
  const Court({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  CourtsCompanion toCompanion(bool nullToAbsent) {
    return CourtsCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory Court.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Court(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  Court copyWith({int? id, String? name}) => Court(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  @override
  String toString() {
    return (StringBuffer('Court(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Court && other.id == this.id && other.name == this.name);
}

class CourtsCompanion extends UpdateCompanion<Court> {
  final Value<int> id;
  final Value<String> name;
  const CourtsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  CourtsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<Court> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  CourtsCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return CourtsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CourtsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $TimesTable extends Times with TableInfo<$TimesTable, Time> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TimesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _hoursMeta = const VerificationMeta('hours');
  @override
  late final GeneratedColumn<String> hours = GeneratedColumn<String>(
      'hours', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, hours];
  @override
  String get aliasedName => _alias ?? 'times';
  @override
  String get actualTableName => 'times';
  @override
  VerificationContext validateIntegrity(Insertable<Time> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('hours')) {
      context.handle(
          _hoursMeta, hours.isAcceptableOrUnknown(data['hours']!, _hoursMeta));
    } else if (isInserting) {
      context.missing(_hoursMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Time map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Time(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      hours: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}hours'])!,
    );
  }

  @override
  $TimesTable createAlias(String alias) {
    return $TimesTable(attachedDatabase, alias);
  }
}

class Time extends DataClass implements Insertable<Time> {
  final int id;
  final String hours;
  const Time({required this.id, required this.hours});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['hours'] = Variable<String>(hours);
    return map;
  }

  TimesCompanion toCompanion(bool nullToAbsent) {
    return TimesCompanion(
      id: Value(id),
      hours: Value(hours),
    );
  }

  factory Time.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Time(
      id: serializer.fromJson<int>(json['id']),
      hours: serializer.fromJson<String>(json['hours']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'hours': serializer.toJson<String>(hours),
    };
  }

  Time copyWith({int? id, String? hours}) => Time(
        id: id ?? this.id,
        hours: hours ?? this.hours,
      );
  @override
  String toString() {
    return (StringBuffer('Time(')
          ..write('id: $id, ')
          ..write('hours: $hours')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, hours);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Time && other.id == this.id && other.hours == this.hours);
}

class TimesCompanion extends UpdateCompanion<Time> {
  final Value<int> id;
  final Value<String> hours;
  const TimesCompanion({
    this.id = const Value.absent(),
    this.hours = const Value.absent(),
  });
  TimesCompanion.insert({
    this.id = const Value.absent(),
    required String hours,
  }) : hours = Value(hours);
  static Insertable<Time> custom({
    Expression<int>? id,
    Expression<String>? hours,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (hours != null) 'hours': hours,
    });
  }

  TimesCompanion copyWith({Value<int>? id, Value<String>? hours}) {
    return TimesCompanion(
      id: id ?? this.id,
      hours: hours ?? this.hours,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (hours.present) {
      map['hours'] = Variable<String>(hours.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TimesCompanion(')
          ..write('id: $id, ')
          ..write('hours: $hours')
          ..write(')'))
        .toString();
  }
}

class $SchedulesTable extends Schedules
    with TableInfo<$SchedulesTable, Schedule> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SchedulesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _courtMeta = const VerificationMeta('court');
  @override
  late final GeneratedColumn<int> court = GeneratedColumn<int>(
      'court', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES courts (id)'));
  static const VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int> time = GeneratedColumn<int>(
      'time', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES times (id)'));
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, court, time, date, username];
  @override
  String get aliasedName => _alias ?? 'schedules';
  @override
  String get actualTableName => 'schedules';
  @override
  VerificationContext validateIntegrity(Insertable<Schedule> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('court')) {
      context.handle(
          _courtMeta, court.isAcceptableOrUnknown(data['court']!, _courtMeta));
    } else if (isInserting) {
      context.missing(_courtMeta);
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Schedule map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Schedule(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      court: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}court'])!,
      time: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}time'])!,
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
    );
  }

  @override
  $SchedulesTable createAlias(String alias) {
    return $SchedulesTable(attachedDatabase, alias);
  }
}

class Schedule extends DataClass implements Insertable<Schedule> {
  final int id;
  final int court;
  final int time;
  final DateTime date;
  final String username;
  const Schedule(
      {required this.id,
      required this.court,
      required this.time,
      required this.date,
      required this.username});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['court'] = Variable<int>(court);
    map['time'] = Variable<int>(time);
    map['date'] = Variable<DateTime>(date);
    map['username'] = Variable<String>(username);
    return map;
  }

  SchedulesCompanion toCompanion(bool nullToAbsent) {
    return SchedulesCompanion(
      id: Value(id),
      court: Value(court),
      time: Value(time),
      date: Value(date),
      username: Value(username),
    );
  }

  factory Schedule.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Schedule(
      id: serializer.fromJson<int>(json['id']),
      court: serializer.fromJson<int>(json['court']),
      time: serializer.fromJson<int>(json['time']),
      date: serializer.fromJson<DateTime>(json['date']),
      username: serializer.fromJson<String>(json['username']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'court': serializer.toJson<int>(court),
      'time': serializer.toJson<int>(time),
      'date': serializer.toJson<DateTime>(date),
      'username': serializer.toJson<String>(username),
    };
  }

  Schedule copyWith(
          {int? id, int? court, int? time, DateTime? date, String? username}) =>
      Schedule(
        id: id ?? this.id,
        court: court ?? this.court,
        time: time ?? this.time,
        date: date ?? this.date,
        username: username ?? this.username,
      );
  @override
  String toString() {
    return (StringBuffer('Schedule(')
          ..write('id: $id, ')
          ..write('court: $court, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, court, time, date, username);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Schedule &&
          other.id == this.id &&
          other.court == this.court &&
          other.time == this.time &&
          other.date == this.date &&
          other.username == this.username);
}

class SchedulesCompanion extends UpdateCompanion<Schedule> {
  final Value<int> id;
  final Value<int> court;
  final Value<int> time;
  final Value<DateTime> date;
  final Value<String> username;
  const SchedulesCompanion({
    this.id = const Value.absent(),
    this.court = const Value.absent(),
    this.time = const Value.absent(),
    this.date = const Value.absent(),
    this.username = const Value.absent(),
  });
  SchedulesCompanion.insert({
    this.id = const Value.absent(),
    required int court,
    required int time,
    required DateTime date,
    required String username,
  })  : court = Value(court),
        time = Value(time),
        date = Value(date),
        username = Value(username);
  static Insertable<Schedule> custom({
    Expression<int>? id,
    Expression<int>? court,
    Expression<int>? time,
    Expression<DateTime>? date,
    Expression<String>? username,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (court != null) 'court': court,
      if (time != null) 'time': time,
      if (date != null) 'date': date,
      if (username != null) 'username': username,
    });
  }

  SchedulesCompanion copyWith(
      {Value<int>? id,
      Value<int>? court,
      Value<int>? time,
      Value<DateTime>? date,
      Value<String>? username}) {
    return SchedulesCompanion(
      id: id ?? this.id,
      court: court ?? this.court,
      time: time ?? this.time,
      date: date ?? this.date,
      username: username ?? this.username,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (court.present) {
      map['court'] = Variable<int>(court.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SchedulesCompanion(')
          ..write('id: $id, ')
          ..write('court: $court, ')
          ..write('time: $time, ')
          ..write('date: $date, ')
          ..write('username: $username')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $CourtsTable courts = $CourtsTable(this);
  late final $TimesTable times = $TimesTable(this);
  late final $SchedulesTable schedules = $SchedulesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [courts, times, schedules];
}
