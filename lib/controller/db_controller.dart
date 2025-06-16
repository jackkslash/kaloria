import 'package:kaloria/data/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'db_controller.g.dart';

typedef DatabaseStateData = ({AppDatabase? database});

const DatabaseStateData initialDatabaseStateData = (database: null);

@Riverpod(keepAlive: true)
class DatabaseNotifier extends _$DatabaseNotifier {
  @override
  DatabaseStateData build() => initialDatabaseStateData;

  void _setState({AppDatabase? database}) {
    state = (database: database ?? state.database);
  }

  void resetState() => state = initialDatabaseStateData;

  /// Initialize database by simply creating AppDatabase without an executor
  void initDatabase() {
    _setState(database: AppDatabase());
  }
}
