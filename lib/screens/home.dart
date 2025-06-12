import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaloria/contorller/date_controller.dart';
import 'package:kaloria/contorller/navbar_controller.dart';
import 'package:kaloria/utils/date_format.dart';

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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 128),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '1,750 cal',
                    style: TextStyle(fontSize: 42, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Calories consumed on ${formatDateManual(selectedDate)}',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
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
