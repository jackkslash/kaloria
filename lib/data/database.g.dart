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
  List<GeneratedColumn> get $columns => [id, createdAt];
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
  final DateTime createdAt;
  const DatabaseDiaryEntryData({required this.id, required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DatabaseDiaryEntryCompanion toCompanion(bool nullToAbsent) {
    return DatabaseDiaryEntryCompanion(
      id: Value(id),
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
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DatabaseDiaryEntryData copyWith({int? id, DateTime? createdAt}) =>
      DatabaseDiaryEntryData(
        id: id ?? this.id,
        createdAt: createdAt ?? this.createdAt,
      );
  DatabaseDiaryEntryData copyWithCompanion(DatabaseDiaryEntryCompanion data) {
    return DatabaseDiaryEntryData(
      id: data.id.present ? data.id.value : this.id,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseDiaryEntryData(')
          ..write('id: $id, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseDiaryEntryData &&
          other.id == this.id &&
          other.createdAt == this.createdAt);
}

class DatabaseDiaryEntryCompanion
    extends UpdateCompanion<DatabaseDiaryEntryData> {
  final Value<int> id;
  final Value<DateTime> createdAt;
  const DatabaseDiaryEntryCompanion({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DatabaseDiaryEntryCompanion.insert({
    this.id = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DatabaseDiaryEntryData> custom({
    Expression<int>? id,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DatabaseDiaryEntryCompanion copyWith({
    Value<int>? id,
    Value<DateTime>? createdAt,
  }) {
    return DatabaseDiaryEntryCompanion(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DatabaseItemEntryTable extends DatabaseItemEntry
    with TableInfo<$DatabaseItemEntryTable, DatabaseItemEntryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DatabaseItemEntryTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _diaryEntryIdMeta = const VerificationMeta(
    'diaryEntryId',
  );
  @override
  late final GeneratedColumn<int> diaryEntryId = GeneratedColumn<int>(
    'diary_entry_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES database_diary_entry (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _caloriesMeta = const VerificationMeta(
    'calories',
  );
  @override
  late final GeneratedColumn<double> calories = GeneratedColumn<double>(
    'calories',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
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
  List<GeneratedColumn> get $columns => [
    id,
    diaryEntryId,
    name,
    calories,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'database_item_entry';
  @override
  VerificationContext validateIntegrity(
    Insertable<DatabaseItemEntryData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('diary_entry_id')) {
      context.handle(
        _diaryEntryIdMeta,
        diaryEntryId.isAcceptableOrUnknown(
          data['diary_entry_id']!,
          _diaryEntryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_diaryEntryIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('calories')) {
      context.handle(
        _caloriesMeta,
        calories.isAcceptableOrUnknown(data['calories']!, _caloriesMeta),
      );
    } else if (isInserting) {
      context.missing(_caloriesMeta);
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
  DatabaseItemEntryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DatabaseItemEntryData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      diaryEntryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}diary_entry_id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      calories: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}calories'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $DatabaseItemEntryTable createAlias(String alias) {
    return $DatabaseItemEntryTable(attachedDatabase, alias);
  }
}

class DatabaseItemEntryData extends DataClass
    implements Insertable<DatabaseItemEntryData> {
  final int id;
  final int diaryEntryId;
  final String name;
  final double calories;
  final DateTime createdAt;
  const DatabaseItemEntryData({
    required this.id,
    required this.diaryEntryId,
    required this.name,
    required this.calories,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['diary_entry_id'] = Variable<int>(diaryEntryId);
    map['name'] = Variable<String>(name);
    map['calories'] = Variable<double>(calories);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  DatabaseItemEntryCompanion toCompanion(bool nullToAbsent) {
    return DatabaseItemEntryCompanion(
      id: Value(id),
      diaryEntryId: Value(diaryEntryId),
      name: Value(name),
      calories: Value(calories),
      createdAt: Value(createdAt),
    );
  }

  factory DatabaseItemEntryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DatabaseItemEntryData(
      id: serializer.fromJson<int>(json['id']),
      diaryEntryId: serializer.fromJson<int>(json['diaryEntryId']),
      name: serializer.fromJson<String>(json['name']),
      calories: serializer.fromJson<double>(json['calories']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'diaryEntryId': serializer.toJson<int>(diaryEntryId),
      'name': serializer.toJson<String>(name),
      'calories': serializer.toJson<double>(calories),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  DatabaseItemEntryData copyWith({
    int? id,
    int? diaryEntryId,
    String? name,
    double? calories,
    DateTime? createdAt,
  }) => DatabaseItemEntryData(
    id: id ?? this.id,
    diaryEntryId: diaryEntryId ?? this.diaryEntryId,
    name: name ?? this.name,
    calories: calories ?? this.calories,
    createdAt: createdAt ?? this.createdAt,
  );
  DatabaseItemEntryData copyWithCompanion(DatabaseItemEntryCompanion data) {
    return DatabaseItemEntryData(
      id: data.id.present ? data.id.value : this.id,
      diaryEntryId: data.diaryEntryId.present
          ? data.diaryEntryId.value
          : this.diaryEntryId,
      name: data.name.present ? data.name.value : this.name,
      calories: data.calories.present ? data.calories.value : this.calories,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseItemEntryData(')
          ..write('id: $id, ')
          ..write('diaryEntryId: $diaryEntryId, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, diaryEntryId, name, calories, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DatabaseItemEntryData &&
          other.id == this.id &&
          other.diaryEntryId == this.diaryEntryId &&
          other.name == this.name &&
          other.calories == this.calories &&
          other.createdAt == this.createdAt);
}

class DatabaseItemEntryCompanion
    extends UpdateCompanion<DatabaseItemEntryData> {
  final Value<int> id;
  final Value<int> diaryEntryId;
  final Value<String> name;
  final Value<double> calories;
  final Value<DateTime> createdAt;
  const DatabaseItemEntryCompanion({
    this.id = const Value.absent(),
    this.diaryEntryId = const Value.absent(),
    this.name = const Value.absent(),
    this.calories = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DatabaseItemEntryCompanion.insert({
    this.id = const Value.absent(),
    required int diaryEntryId,
    required String name,
    required double calories,
    this.createdAt = const Value.absent(),
  }) : diaryEntryId = Value(diaryEntryId),
       name = Value(name),
       calories = Value(calories);
  static Insertable<DatabaseItemEntryData> custom({
    Expression<int>? id,
    Expression<int>? diaryEntryId,
    Expression<String>? name,
    Expression<double>? calories,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (diaryEntryId != null) 'diary_entry_id': diaryEntryId,
      if (name != null) 'name': name,
      if (calories != null) 'calories': calories,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  DatabaseItemEntryCompanion copyWith({
    Value<int>? id,
    Value<int>? diaryEntryId,
    Value<String>? name,
    Value<double>? calories,
    Value<DateTime>? createdAt,
  }) {
    return DatabaseItemEntryCompanion(
      id: id ?? this.id,
      diaryEntryId: diaryEntryId ?? this.diaryEntryId,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (diaryEntryId.present) {
      map['diary_entry_id'] = Variable<int>(diaryEntryId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (calories.present) {
      map['calories'] = Variable<double>(calories.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DatabaseItemEntryCompanion(')
          ..write('id: $id, ')
          ..write('diaryEntryId: $diaryEntryId, ')
          ..write('name: $name, ')
          ..write('calories: $calories, ')
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
  late final $DatabaseItemEntryTable databaseItemEntry =
      $DatabaseItemEntryTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    databaseDiaryEntry,
    databaseItemEntry,
  ];
}

typedef $$DatabaseDiaryEntryTableCreateCompanionBuilder =
    DatabaseDiaryEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
    });
typedef $$DatabaseDiaryEntryTableUpdateCompanionBuilder =
    DatabaseDiaryEntryCompanion Function({
      Value<int> id,
      Value<DateTime> createdAt,
    });

final class $$DatabaseDiaryEntryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DatabaseDiaryEntryTable,
          DatabaseDiaryEntryData
        > {
  $$DatabaseDiaryEntryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<
    $DatabaseItemEntryTable,
    List<DatabaseItemEntryData>
  >
  _databaseItemEntryRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.databaseItemEntry,
        aliasName: $_aliasNameGenerator(
          db.databaseDiaryEntry.id,
          db.databaseItemEntry.diaryEntryId,
        ),
      );

  $$DatabaseItemEntryTableProcessedTableManager get databaseItemEntryRefs {
    final manager = $$DatabaseItemEntryTableTableManager(
      $_db,
      $_db.databaseItemEntry,
    ).filter((f) => f.diaryEntryId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _databaseItemEntryRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

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

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> databaseItemEntryRefs(
    Expression<bool> Function($$DatabaseItemEntryTableFilterComposer f) f,
  ) {
    final $$DatabaseItemEntryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.databaseItemEntry,
      getReferencedColumn: (t) => t.diaryEntryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DatabaseItemEntryTableFilterComposer(
            $db: $db,
            $table: $db.databaseItemEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> databaseItemEntryRefs<T extends Object>(
    Expression<T> Function($$DatabaseItemEntryTableAnnotationComposer a) f,
  ) {
    final $$DatabaseItemEntryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.databaseItemEntry,
          getReferencedColumn: (t) => t.diaryEntryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DatabaseItemEntryTableAnnotationComposer(
                $db: $db,
                $table: $db.databaseItemEntry,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
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
          (DatabaseDiaryEntryData, $$DatabaseDiaryEntryTableReferences),
          DatabaseDiaryEntryData,
          PrefetchHooks Function({bool databaseItemEntryRefs})
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
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseDiaryEntryCompanion(id: id, createdAt: createdAt),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseDiaryEntryCompanion.insert(
                id: id,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DatabaseDiaryEntryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({databaseItemEntryRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (databaseItemEntryRefs) db.databaseItemEntry,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (databaseItemEntryRefs)
                    await $_getPrefetchedData<
                      DatabaseDiaryEntryData,
                      $DatabaseDiaryEntryTable,
                      DatabaseItemEntryData
                    >(
                      currentTable: table,
                      referencedTable: $$DatabaseDiaryEntryTableReferences
                          ._databaseItemEntryRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$DatabaseDiaryEntryTableReferences(
                            db,
                            table,
                            p0,
                          ).databaseItemEntryRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.diaryEntryId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
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
      (DatabaseDiaryEntryData, $$DatabaseDiaryEntryTableReferences),
      DatabaseDiaryEntryData,
      PrefetchHooks Function({bool databaseItemEntryRefs})
    >;
typedef $$DatabaseItemEntryTableCreateCompanionBuilder =
    DatabaseItemEntryCompanion Function({
      Value<int> id,
      required int diaryEntryId,
      required String name,
      required double calories,
      Value<DateTime> createdAt,
    });
typedef $$DatabaseItemEntryTableUpdateCompanionBuilder =
    DatabaseItemEntryCompanion Function({
      Value<int> id,
      Value<int> diaryEntryId,
      Value<String> name,
      Value<double> calories,
      Value<DateTime> createdAt,
    });

final class $$DatabaseItemEntryTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DatabaseItemEntryTable,
          DatabaseItemEntryData
        > {
  $$DatabaseItemEntryTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DatabaseDiaryEntryTable _diaryEntryIdTable(_$AppDatabase db) =>
      db.databaseDiaryEntry.createAlias(
        $_aliasNameGenerator(
          db.databaseItemEntry.diaryEntryId,
          db.databaseDiaryEntry.id,
        ),
      );

  $$DatabaseDiaryEntryTableProcessedTableManager get diaryEntryId {
    final $_column = $_itemColumn<int>('diary_entry_id')!;

    final manager = $$DatabaseDiaryEntryTableTableManager(
      $_db,
      $_db.databaseDiaryEntry,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_diaryEntryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DatabaseItemEntryTableFilterComposer
    extends Composer<_$AppDatabase, $DatabaseItemEntryTable> {
  $$DatabaseItemEntryTableFilterComposer({
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DatabaseDiaryEntryTableFilterComposer get diaryEntryId {
    final $$DatabaseDiaryEntryTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.diaryEntryId,
      referencedTable: $db.databaseDiaryEntry,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DatabaseDiaryEntryTableFilterComposer(
            $db: $db,
            $table: $db.databaseDiaryEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DatabaseItemEntryTableOrderingComposer
    extends Composer<_$AppDatabase, $DatabaseItemEntryTable> {
  $$DatabaseItemEntryTableOrderingComposer({
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get calories => $composableBuilder(
    column: $table.calories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DatabaseDiaryEntryTableOrderingComposer get diaryEntryId {
    final $$DatabaseDiaryEntryTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.diaryEntryId,
      referencedTable: $db.databaseDiaryEntry,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DatabaseDiaryEntryTableOrderingComposer(
            $db: $db,
            $table: $db.databaseDiaryEntry,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DatabaseItemEntryTableAnnotationComposer
    extends Composer<_$AppDatabase, $DatabaseItemEntryTable> {
  $$DatabaseItemEntryTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get calories =>
      $composableBuilder(column: $table.calories, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DatabaseDiaryEntryTableAnnotationComposer get diaryEntryId {
    final $$DatabaseDiaryEntryTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.diaryEntryId,
          referencedTable: $db.databaseDiaryEntry,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DatabaseDiaryEntryTableAnnotationComposer(
                $db: $db,
                $table: $db.databaseDiaryEntry,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$DatabaseItemEntryTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DatabaseItemEntryTable,
          DatabaseItemEntryData,
          $$DatabaseItemEntryTableFilterComposer,
          $$DatabaseItemEntryTableOrderingComposer,
          $$DatabaseItemEntryTableAnnotationComposer,
          $$DatabaseItemEntryTableCreateCompanionBuilder,
          $$DatabaseItemEntryTableUpdateCompanionBuilder,
          (DatabaseItemEntryData, $$DatabaseItemEntryTableReferences),
          DatabaseItemEntryData,
          PrefetchHooks Function({bool diaryEntryId})
        > {
  $$DatabaseItemEntryTableTableManager(
    _$AppDatabase db,
    $DatabaseItemEntryTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DatabaseItemEntryTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DatabaseItemEntryTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DatabaseItemEntryTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> diaryEntryId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<double> calories = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseItemEntryCompanion(
                id: id,
                diaryEntryId: diaryEntryId,
                name: name,
                calories: calories,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int diaryEntryId,
                required String name,
                required double calories,
                Value<DateTime> createdAt = const Value.absent(),
              }) => DatabaseItemEntryCompanion.insert(
                id: id,
                diaryEntryId: diaryEntryId,
                name: name,
                calories: calories,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DatabaseItemEntryTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({diaryEntryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (diaryEntryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.diaryEntryId,
                                referencedTable:
                                    $$DatabaseItemEntryTableReferences
                                        ._diaryEntryIdTable(db),
                                referencedColumn:
                                    $$DatabaseItemEntryTableReferences
                                        ._diaryEntryIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DatabaseItemEntryTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DatabaseItemEntryTable,
      DatabaseItemEntryData,
      $$DatabaseItemEntryTableFilterComposer,
      $$DatabaseItemEntryTableOrderingComposer,
      $$DatabaseItemEntryTableAnnotationComposer,
      $$DatabaseItemEntryTableCreateCompanionBuilder,
      $$DatabaseItemEntryTableUpdateCompanionBuilder,
      (DatabaseItemEntryData, $$DatabaseItemEntryTableReferences),
      DatabaseItemEntryData,
      PrefetchHooks Function({bool diaryEntryId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DatabaseDiaryEntryTableTableManager get databaseDiaryEntry =>
      $$DatabaseDiaryEntryTableTableManager(_db, _db.databaseDiaryEntry);
  $$DatabaseItemEntryTableTableManager get databaseItemEntry =>
      $$DatabaseItemEntryTableTableManager(_db, _db.databaseItemEntry);
}
