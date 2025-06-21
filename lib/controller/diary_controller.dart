import 'package:drift/drift.dart';
import 'package:kaloria/controller/db_controller.dart';
import 'package:kaloria/data/database.dart';
import 'package:kaloria/models/diary.dart';
import 'package:kaloria/models/item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'dart:math';

part 'diary_controller.g.dart';

@Riverpod(keepAlive: true)
class DiaryEntriesNotifier extends _$DiaryEntriesNotifier {
  @override
  List<DiaryEntry> build() {
    seedWithFakeData();
    return [];
  }

  /// Seeds the database with fake diary and item entries if empty.
  Future<void> seedWithFakeData() async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db == null) return;
    final diaryCount = await db.select(db.databaseDiaryEntry).get();
    if (diaryCount.isNotEmpty) return;
    // Insert 3 diary entries for 3 consecutive days
    for (int i = 0; i < 3; i++) {
      final date = DateTime.now().subtract(Duration(days: i));
      final diaryId = await db.into(db.databaseDiaryEntry).insert(
        DatabaseDiaryEntryCompanion(
          createdAt: Value(date),
        ),
      );
      // Insert 2-4 items for each diary entry
      for (int j = 0; j < 2 + Random().nextInt(3); j++) {
        await db.into(db.databaseItemEntry).insert(
          DatabaseItemEntryCompanion(
            diaryEntryId: Value(diaryId),
            name: Value('Food ${j + 1}'),
            calories: Value(100 + Random().nextInt(200).toDouble()),
            createdAt: Value(date.add(Duration(hours: j))),
          ),
        );
      }
    }
  }

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

  /// Returns the DiaryEntry and all related ItemEntry objects for a given date.
  Future<Map<String, dynamic>?> getDiaryEntryWithItemsForDate(
    DateTime date,
  ) async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db == null) return null;
    // Find the diary entry for the given date
    final dbEntries = await db.select(db.databaseDiaryEntry).get();
    DatabaseDiaryEntryData? diaryData;
    for (final e in dbEntries) {
      if (e.createdAt.year == date.year &&
          e.createdAt.month == date.month &&
          e.createdAt.day == date.day) {
        diaryData = e;
        break;
      }
    }
    if (diaryData == null) return null;
    final diaryEntry = DiaryEntry.fromData(diaryData);
    // Get all items for this diary entry
    final dbItems = await (db.select(
      db.databaseItemEntry,
    )..where((tbl) => tbl.diaryEntryId.equals(diaryEntry.id))).get();
    final items = dbItems.map(ItemEntry.fromData).toList();
    return {'diaryEntry': diaryEntry, 'items': items};
  }
}
