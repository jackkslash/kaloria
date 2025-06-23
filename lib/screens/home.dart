import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaloria/controller/date_controller.dart';
import 'package:kaloria/controller/navbar_controller.dart';
import 'package:kaloria/screens/widgets/progress_indicator.dart';
import 'package:kaloria/utils/date_format.dart';
import 'package:kaloria/models/item.dart';
import 'package:kaloria/controller/diary_controller.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);
    final diaryNotifier = ref.read(diaryEntriesNotifierProvider.notifier);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        ref.read(navBarProvider.notifier).collapseAll();
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 225, 225, 225),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 8),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                spacing: 20,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 50,
                    children: [
                      ProgressCircle(
                        currentValue: 0.5,
                        targetValue: 1,
                        size: 60,
                        fillColor: const Color.fromARGB(255, 99, 99, 99),
                        backgroundColor: const Color.fromARGB(
                          255,
                          255,
                          255,
                          255,
                        ),
                        strokeWidth: 20.0,
                      ),
                      Column(
                        children: [
                          Text(
                            '1,750',
                            style: TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            ' remaning on ${formatDateManual(selectedDate)}',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  FutureBuilder<Map<String, dynamic>?>(
                    future: diaryNotifier.getDiaryEntryWithItemsForDate(
                      selectedDate,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final data = snapshot.data;
                      final items = data != null
                          ? data['items'] as List<ItemEntry>
                          : [];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.96,
                          child: Container(
                            padding: EdgeInsets.all(32),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Items for this date',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 12),
                                  ...items.map((item) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 8.0,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.name,
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          Text(
                                            '${item.calories.toStringAsFixed(0)} cal',
                                            style: TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
