import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:path_provider/path_provider.dart';

part 'database.g.dart';

class DatabaseDiaryEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

class DatabaseItemEntry extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get diaryEntryId => integer().references(DatabaseDiaryEntry, #id)();
  TextColumn get name => text()();
  RealColumn get calories => real()();
  DateTimeColumn get createdAt =>
      dateTime().clientDefault(() => DateTime.now())();
}

@DriftDatabase(tables: [DatabaseDiaryEntry, DatabaseItemEntry])
class AppDatabase extends _$AppDatabase {
  // After generating code, this class needs to define a `schemaVersion` getter
  // and a constructor telling drift where the database should be stored.
  // These are described in the getting started guide: https://drift.simonbinder.eu/setup/
  AppDatabase([QueryExecutor? executor]) : super(executor ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(
      name: 'kaloria',
      native: DriftNativeOptions(
        // By default, `driftDatabase` from `package:drift_flutter` stores the
        // database files in `getApplicationDocumentsDirectory()`.
        databaseDirectory: () => getApplicationSupportDirectory(),
      ),
      // If you need web support, see https://drift.simonbinder.eu/platforms/web/
    );
  }
}
