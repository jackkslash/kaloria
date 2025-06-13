import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kaloria/contorller/date_controller.dart';
import 'package:kaloria/contorller/navbar_controller.dart';
import 'package:kaloria/models/navbar.dart';
import 'package:kaloria/utils/curver_drawer.dart';
import 'package:kaloria/utils/date_format.dart';

class ExpandableBottomNav extends ConsumerStatefulWidget {
  const ExpandableBottomNav({super.key});

  @override
  ConsumerState<ExpandableBottomNav> createState() =>
      _ExpandableBottomNavState();
}

class _ExpandableBottomNavState extends ConsumerState<ExpandableBottomNav> {
  static const _animationDuration = Duration(milliseconds: 200);

  Widget _getCurrentContent(NavBarState state, WidgetRef ref) {
    switch (state.expanded) {
      case ExpandedSection.date:
        return _buildExpandedDateContent(state, ref);
      case ExpandedSection.scan:
        return _buildExpandedScanContent(state);
      case ExpandedSection.add:
        return _buildExpandedAddContent(state);
      default:
        return _buildCollapsedContent(state, ref);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(navBarProvider);

    return AnimatedContainer(
      duration: _animationDuration,
      height: state.currentHeight,
      curve: Curves.easeInOutCubic,
      color: Colors.grey,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BottomAppBar(
            color: Colors.black,
            height: double.infinity,
            child: _getCurrentContent(state, ref),
          ),
          _buildCurve(),
        ],
      ),
    );
  }

  Widget _buildExpandedDateContent(NavBarState state, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);

    final formattedDate = formatDateManual(selectedDate);
    final dateParts = formattedDate.split(' ');

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Align(alignment: Alignment.center, child: _buildDateButton(state)),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    ref.read(selectedDateProvider.notifier).previousDay();
                  },
                  icon: const Icon(
                    Icons.arrow_left,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                GestureDetector(
                  onHorizontalDragEnd: (details) {
                    if (details.primaryVelocity! > 0) {
                      // Swipe right
                      ref.read(selectedDateProvider.notifier).previousDay();
                    } else if (details.primaryVelocity! < 0) {
                      // Swipe left
                      ref.read(selectedDateProvider.notifier).nextDay();
                    }
                  },
                  child: SizedBox(
                    width: 200, // Fixed width
                    child: Column(
                      children: [
                        Text(
                          dateParts.isNotEmpty ? dateParts[0] : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 18),
                        Text(
                          dateParts.length > 1 ? dateParts[1] : '',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 48,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    ref.read(selectedDateProvider.notifier).nextDay();
                  },
                  icon: const Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedScanContent(NavBarState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(alignment: Alignment.center, child: _buildScanButton(state)),
      ],
    );
  }

  Widget _buildExpandedAddContent(NavBarState state) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Align(alignment: Alignment.center, child: _buildAddButton(state)),
      ],
    );
  }

  Widget _buildCollapsedContent(NavBarState state, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (DateTime.now().day != selectedDate.day) _buildReturnButton(state),
          _buildDateButton(state),
          _buildScanButton(state),
          _buildAddButton(state),
        ],
      ),
    );
  }

  void _toggleDateExpanded(NavBarState state) {
    final notifier = ref.read(navBarProvider.notifier);
    if (state.expanded != ExpandedSection.date) {
      notifier.expandDate();
      context.go('/home');
    } else {
      notifier.collapseAll();
    }
  }

  void _toggleScanExpanded(NavBarState state) {
    final notifier = ref.read(navBarProvider.notifier);
    if (state.expanded != ExpandedSection.scan) {
      notifier.expandScan();
      context.go('/scan');
    } else {
      notifier.collapseAll();
      context.go('/home');
    }
  }

  void _toggleAddExpanded(NavBarState state) {
    final notifier = ref.read(navBarProvider.notifier);
    if (state.expanded != ExpandedSection.add) {
      notifier.expandAdd();
      context.go('/add');
    } else {
      notifier.collapseAll();
      context.go('/home');
    }
  }

  Widget _buildDateButton(NavBarState state) {
    final selectedDate = ref.watch(selectedDateProvider);
    final now = DateTime.now();

    // Remove time part to ensure accurate date-only comparison
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime selected = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
    );

    final int dayDifference = selected.difference(today).inDays;
    String dateText;
    switch (dayDifference) {
      case 0:
        dateText = 'Today';
        break;
      case 1:
        dateText = 'Tomorrow';
        break;
      case -1:
        dateText = 'Yesterday';
        break;
      default:
        dateText = formatDateManual(selectedDate, useShortForm: true);
    }

    return ElevatedButton.icon(
      onPressed: () => _toggleDateExpanded(state),
      icon: const Icon(Icons.calendar_today, color: Colors.black),
      label: Text(dateText, style: const TextStyle(color: Colors.black)),
      style: ElevatedButton.styleFrom(
        backgroundColor: state.expanded == ExpandedSection.date
            ? Colors.grey[300]
            : Colors.white,
      ),
    );
  }

  Widget _buildAddButton(NavBarState state) {
    return ElevatedButton(
      onPressed: () => _toggleAddExpanded(state),
      style: ElevatedButton.styleFrom(
        backgroundColor: state.expanded == ExpandedSection.add
            ? Colors.grey[300]
            : Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32.0),
      ),
      child: const Icon(Icons.add, color: Colors.black),
    );
  }

  Widget _buildScanButton(NavBarState state) {
    return ElevatedButton(
      onPressed: () => _toggleScanExpanded(state),
      style: ElevatedButton.styleFrom(
        backgroundColor: state.expanded == ExpandedSection.scan
            ? Colors.grey[300]
            : Colors.white,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
      ),
      child: state.expanded == ExpandedSection.scan
          ? const Icon(Icons.arrow_downward)
          : const Icon(Icons.camera_alt, color: Colors.black),
    );
  }

  Widget _buildReturnButton(NavBarState state) {
    return ElevatedButton(
      onPressed: () {
        ref.read(selectedDateProvider.notifier).todayDay();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        shape: const CircleBorder(),
      ),
      child: const Icon(Icons.arrow_left),
    );
  }

  Widget _buildCurve() {
    return Positioned(
      top: -75,
      left: 0,
      right: 0,
      child: Row(
        children: [
          CustomPaint(size: const Size(75, 75), painter: CurvedCornerPainter()),
          const Spacer(),
          Transform.flip(
            flipX: true,
            child: CustomPaint(
              size: const Size(75, 75),
              painter: CurvedCornerPainter(),
            ),
          ),
        ],
      ),
    );
  }
}
