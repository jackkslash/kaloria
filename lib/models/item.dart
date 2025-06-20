import 'package:drift/drift.dart';
import 'package:kaloria/data/database.dart';

class ItemEntry {
  final int id;
  final int diaryEntryId;
  final String name;
  final double calories;
  final DateTime createdAt;

  // Constructor for creating a new ItemEntry instance
  ItemEntry({
    required this.id,
    required this.diaryEntryId,
    required this.name,
    required this.calories,
    required this.createdAt,
  });

  factory ItemEntry.fromData(DatabaseItemEntryData data) {
    return ItemEntry(
      id: data.id,
      diaryEntryId: data.diaryEntryId,
      name: data.name,
      calories: data.calories,
      createdAt: data.createdAt,
    );
  }

  DatabaseItemEntryCompanion toCompanion({bool includeId = false}) {
    return DatabaseItemEntryCompanion(
      id: includeId ? Value(id) : const Value.absent(),
      diaryEntryId: Value(diaryEntryId),
      name: Value(name),
      calories: Value(calories),
      createdAt: Value(createdAt),
    );
  }

  ItemEntry copyWith({
    int? id,
    int? diaryEntryId,
    String? name,
    double? calories,
    DateTime? createdAt,
  }) {
    return ItemEntry(
      id: id ?? this.id,
      diaryEntryId: diaryEntryId ?? this.diaryEntryId,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
