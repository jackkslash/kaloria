import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaloria/controller/date_controller.dart';
import 'package:kaloria/controller/navbar_controller.dart';
import 'package:kaloria/screens/widgets/progress_indicator.dart';
import 'package:kaloria/utils/date_format.dart';

final meals = [
  {
    'title': 'Breakfast',
    'items': [
      {'name': 'Oatmeal', 'cal': 150},
      {'name': 'Banana', 'cal': 90},
      {'name': 'Coffee', 'cal': 5},
    ],
  },
  {
    'title': 'Lunch',
    'items': [
      {'name': 'Chicken Wrap', 'cal': 350},
      {'name': 'Apple', 'cal': 95},
      {'name': 'Water', 'cal': 0},
    ],
  },
  {
    'title': 'Dinner',
    'items': [
      {'name': 'Salmon', 'cal': 300},
      {'name': 'Quinoa', 'cal': 180},
      {'name': 'Mixed Vegetables', 'cal': 120},
    ],
  },
  {
    'title': 'Snacks',
    'items': [
      {'name': 'Granola Bar', 'cal': 200},
      {'name': 'Almonds', 'cal': 160},
    ],
  },
  {
    'title': 'Drinks',
    'items': [
      {'name': 'Orange Juice', 'cal': 110},
      {'name': 'Soda', 'cal': 150},
    ],
  },
];

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedDate = ref.watch(selectedDateProvider);

    return GestureDetector(
      behavior:
          HitTestBehavior.opaque, // ensures taps register even on empty areas
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
                  Column(
                    children: meals.map((meal) {
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
                                  // Title
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        meal['title'] as String,
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Icon(
                                          Icons.more_vert,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),

                                  // Items
                                  ...List<Widget>.from(
                                    (meal['items'] as List).map((item) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          bottom: 8.0,
                                          top: 8.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['name'],
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              '${item['cal']} cal',
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList(),
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
