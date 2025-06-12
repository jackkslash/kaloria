import 'package:kaloria/models/navbar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navbar_controller.g.dart';

@riverpod
class NavBar extends _$NavBar {
  @override
  NavBarState build() => const NavBarState();

  void expandDate() => state = state.copyWith(expanded: ExpandedSection.date);
  void expandScan() => state = state.copyWith(expanded: ExpandedSection.scan);
  void expandAdd() => state = state.copyWith(expanded: ExpandedSection.add);
  void collapseAll() => state = state.copyWith(expanded: ExpandedSection.none);
}
