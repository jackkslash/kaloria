import 'package:kaloria/controller/db_controller.dart';
import 'package:kaloria/models/diary.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'diary_controller.g.dart';

@Riverpod(keepAlive: true)
class DiaryEntriesNotifier extends _$DiaryEntriesNotifier {
  @override
  List<DiaryEntry> build() => [];

  /// Loads all diary entries from the database into state.
  Future<void> loadEntriesFromDb() async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db != null) {
      final dbEntries = await db.select(db.databaseDiaryEntry).get();
      state = dbEntries.map(DiaryEntry.fromData).toList();
    }
  }

  /// Adds a DiaryEntry only if no entry exists for the same day, month, and year.
  Future<void> addEntry(DiaryEntry entry) async {
    // If state is empty, load from DB first
    if (state.isEmpty) {
      await loadEntriesFromDb();
    }
    final exists = state.any(
      (e) =>
          e.createdAt.year == entry.createdAt.year &&
          e.createdAt.month == entry.createdAt.month &&
          e.createdAt.day == entry.createdAt.day,
    );
    if (!exists) {
      // Add to local state
      state = [...state, entry];

      // Add to database
      final db = ref.read(databaseNotifierProvider).database;
      if (db != null) {
        await db.into(db.databaseDiaryEntry).insert(entry.toCompanion());
      }
    }
    // else: do nothing or handle duplicate as needed
  }
}
