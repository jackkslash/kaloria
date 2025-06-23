import 'package:kaloria/models/item.dart';
import 'package:kaloria/controller/db_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'item_controller.g.dart';

@Riverpod(keepAlive: true)
class ItemEntriesNotifier extends _$ItemEntriesNotifier {
  @override
  List<ItemEntry> build() => [];

  /// Adds a new item
  Future<void> addItem(ItemEntry item) async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db != null) {
      final id = await db
          .into(db.databaseItemEntry)
          .insert(item.toCompanion(includeId: false));
      final newItem = item.copyWith(id: id);
      state = [...state, newItem];
    }
  }

  /// Updates an existing item
  Future<void> updateItem(ItemEntry item) async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db != null) {
      await (db.update(db.databaseItemEntry)
            ..where((tbl) => tbl.id.equals(item.id)))
          .write(item.toCompanion(includeId: true));
      state = [
        for (final i in state)
          if (i.id == item.id) item else i,
      ];
    }
  }

  /// Deletes an item by id
  Future<void> deleteItem(int id) async {
    final db = ref.read(databaseNotifierProvider).database;
    if (db != null) {
      await (db.delete(
        db.databaseItemEntry,
      )..where((tbl) => tbl.id.equals(id))).go();
      state = state.where((i) => i.id != id).toList();
    }
  }
}
