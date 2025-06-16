// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $DatabaseDiaryEntryTable extends DatabaseDiaryEntry
    with TableInfo<$DatabaseDiaryEntryTable, DatabaseDiaryEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatabaseDiaryEntryTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _startTimeMeta = const VerificationMeta(
    'startTime',
  );
  @override
  late final GeneratedColumn<DateTime> startTime = GeneratedColumn<DateTime>(
    'start_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _endTimeMeta = const VerificationMeta(
    'endTime',
  );
  @override
  late final GeneratedColumn<DateTime> endTime = GeneratedColumn<DateTime>(
    'end_time',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    clientDefault: () => DateTime.now(),
  );
  @override
  List<GeneratedColumn> get $columns => [id, startTime, endTime, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'database_diary_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<DatabaseDiaryEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(
        _startTimeMeta,
        startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta),
      );
    }
    if (data.containsKey('end_time')) {
      context.handle(
        _endTimeMeta,
        endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DatabaseDiaryEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DatabaseDiaryEntryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      startTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}start_time'],
      ),
      endTime: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}end_time'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DatabaseDiaryEntryTable createAlias(String alias) {
    return $DatabaseDiaryEntryTable(attachedDatabase, alias);
  }
}

class DatabaseDiaryEntryData extends DataClass
    implements Insertable<DatabaseDiaryEntryData> {
  final int id;
  final DateTime? startTime;
  final DateTime? endTime;
  final DateTime createdAt;
  const DatabaseDiaryEntryData({
    required this.id,
    this.startTime,
    this.endTime,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime>(endTime);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DatabaseDiaryEntryCompanion toCompanion(bool nullToAbsent) {
    return DatabaseDiaryEntryCompanion(
      id: Value(id),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      createdAt: Value(createdAt),
    );
  }

  factory DatabaseDiaryEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatabaseDiaryEntryData(
      id: serializer.fromJson<int>(json['id']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DatabaseDiaryEntryData copyWith({
    int? id,
    Value<DateTime?> startTime = const Value.absent(),
    Value<DateTime?> endTime = const Value.absent(),
    DateTime? createdAt,
  }) => DatabaseDiaryEntryData(
    id: id ?? this.id,
    startTime: startTime.present ? startTime.value : this.startTime,
    endTime: endTime.present ? endTime.value : this.endTime,
    createdAt: createdAt ?? this.createdAt,
  );
  DatabaseDiaryEntryData copyWithCompanion(DatabaseDiaryEntryCompanion data) {
    return DatabaseDiaryEntryData(
      id: data.id.present ? data.id.value : this.id,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseDiaryEntryData(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startTime, endTime, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseDiaryEntryData &&
          other.id == this.id &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.createdAt == this.createdAt);
}

class DatabaseDiaryEntryCompanion
    extends UpdateCompanion<DatabaseDiaryEntryData> {
  final Value<int> id;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<DateTime> createdAt;
  const DatabaseDiaryEntryCompanion({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DatabaseDiaryEntryCompanion.insert({
    this.id = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DatabaseDiaryEntryData> custom({
    Expression<int>? id,
    Expression<DateTime>? startTime,
    Expression<DateTime>? endTime,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DatabaseDiaryEntryCompanion copyWith({
    Value<int>? id,
    Value<DateTime?>? startTime,
    Value<DateTime?>? endTime,
    Value<DateTime>? createdAt,
  }) {
    return DatabaseDiaryEntryCompanion(
      id: id ?? this.id,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime>(endTime.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseDiaryEntryCompanion(')
          ..write('id: $id, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DatabaseDiaryEntryTable databaseDiaryEntry =
      $DatabaseDiaryEntryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [databaseDiaryEntry];
}

typedef $$DatabaseDiaryEntryTableCreateCompanionBuilder =
    DatabaseDiaryEntryCompanion Function({
      Value<int> id,
      Value<DateTime?> startTime,
      Value<DateTime?> endTime,
      Value<DateTime> createdAt,
    });
typedef $$DatabaseDiaryEntryTableUpdateCompanionBuilder =
    DatabaseDiaryEntryCompanion Function({
      Value<int> id,
      Value<DateTime?> startTime,
      Value<DateTime?> endTime,
      Value<DateTime> createdAt,
    });

class $$DatabaseDiaryEntryTableFilterComposer
    extends Composer<_$AppDatabase, $DatabaseDiaryEntryTable> {
  $$DatabaseDiaryEntryTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DatabaseDiaryEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $DatabaseDiaryEntryTable> {
  $$DatabaseDiaryEntryTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get startTime => $composableBuilder(
    column: $table.startTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get endTime => $composableBuilder(
    column: $table.endTime,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DatabaseDiaryEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $DatabaseDiaryEntryTable> {
  $$DatabaseDiaryEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<DateTime> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$DatabaseDiaryEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DatabaseDiaryEntryTable,
          DatabaseDiaryEntryData,
          $$DatabaseDiaryEntryTableFilterComposer,
          $$DatabaseDiaryEntryTableOrderingComposer,
          $$DatabaseDiaryEntryTableAnnotationComposer,
          $$DatabaseDiaryEntryTableCreateCompanionBuilder,
          $$DatabaseDiaryEntryTableUpdateCompanionBuilder,
          (
            DatabaseDiaryEntryData,
            BaseReferences<
              _$AppDatabase,
              $DatabaseDiaryEntryTable,
              DatabaseDiaryEntryData
            >,
          ),
          DatabaseDiaryEntryData,
          PrefetchHooks Function()
        > {
  $$DatabaseDiaryEntryTableTableManager(
    _$AppDatabase db,
    $DatabaseDiaryEntryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DatabaseDiaryEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DatabaseDiaryEntryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DatabaseDiaryEntryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseDiaryEntryCompanion(
                id: id,
                startTime: startTime,
                endTime: endTime,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime?> startTime = const Value.absent(),
                Value<DateTime?> endTime = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseDiaryEntryCompanion.insert(
                id: id,
                startTime: startTime,
                endTime: endTime,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DatabaseDiaryEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DatabaseDiaryEntryTable,
      DatabaseDiaryEntryData,
      $$DatabaseDiaryEntryTableFilterComposer,
      $$DatabaseDiaryEntryTableOrderingComposer,
      $$DatabaseDiaryEntryTableAnnotationComposer,
      $$DatabaseDiaryEntryTableCreateCompanionBuilder,
      $$DatabaseDiaryEntryTableUpdateCompanionBuilder,
      (
        DatabaseDiaryEntryData,
        BaseReferences<
          _$AppDatabase,
          $DatabaseDiaryEntryTable,
          DatabaseDiaryEntryData
        >,
      ),
      DatabaseDiaryEntryData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DatabaseDiaryEntryTableTableManager get databaseDiaryEntry =>
      $$DatabaseDiaryEntryTableTableManager(_db, _db.databaseDiaryEntry);
}
