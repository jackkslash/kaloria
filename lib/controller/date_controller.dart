import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'date_controller.g.dart';

@Riverpod(keepAlive: true)
class SelectedDate extends _$SelectedDate {
  @override
  DateTime build() {
    return DateTime.now(); // initial date
  }

  void nextDay() => state = state.add(Duration(days: 1));

  void previousDay() => state = state.subtract(Duration(days: 1));

  void todayDay() => state = DateTime.now();
}
