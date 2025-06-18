import 'package:drift/drift.dart';
import 'package:kaloria/data/database.dart';

class DiaryEntry {
  final int id;
  final DateTime createdAt;

  DiaryEntry({required this.id, required this.createdAt});

  factory DiaryEntry.fromData(DatabaseDiaryEntryData data) {
    return DiaryEntry(id: data.id, createdAt: data.createdAt);
  }

  DatabaseDiaryEntryCompanion toCompanion({bool includeId = false}) {
    return DatabaseDiaryEntryCompanion(
      id: includeId ? Value(id) : const Value.absent(),
      createdAt: Value(createdAt),
    );
  }

  DiaryEntry copyWith({int? id, DateTime? createdAt}) {
    return DiaryEntry(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
