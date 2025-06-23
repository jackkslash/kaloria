import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kaloria/controller/date_controller.dart';
import 'package:kaloria/controller/diary_controller.dart';
import 'package:kaloria/controller/item_controller.dart';
import 'package:kaloria/models/item.dart';

class AddPage extends ConsumerStatefulWidget {
  const AddPage({super.key});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _calories = 0;

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      appBar: AppBar(
        title: const Text('Add Item'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: ref
            .read(diaryEntriesNotifierProvider.notifier)
            .getDiaryEntryWithItemsForDate(selectedDate),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final diaryEntry = snapshot.data?['diaryEntry'];
          if (diaryEntry == null) {
            return const Center(child: Text('No diary entry for this date.'));
          }
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 32, bottom: 8),
                child: FractionallySizedBox(
                  widthFactor: 0.96,
                  child: Container(
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(60),
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Add Item',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              border: OutlineInputBorder(),
                            ),
                            onSaved: (val) => _name = val ?? '',
                            validator: (val) => val == null || val.isEmpty
                                ? 'Enter a name'
                                : null,
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Calories',
                              border: OutlineInputBorder(),
                            ),
                            keyboardType: TextInputType.number,
                            onSaved: (val) =>
                                _calories = double.tryParse(val ?? '') ?? 0,
                            validator: (val) =>
                                val == null || double.tryParse(val) == null
                                ? 'Enter calories'
                                : null,
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(
                                  255,
                                  99,
                                  99,
                                  99,
                                ),
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16,
                                ),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  _formKey.currentState?.save();
                                  final item = ItemEntry(
                                    id: 0,
                                    diaryEntryId: diaryEntry.id,
                                    name: _name,
                                    calories: _calories,
                                    createdAt: DateTime.now(),
                                  );
                                  await ref
                                      .read(
                                        itemEntriesNotifierProvider.notifier,
                                      )
                                      .addItem(item);
                                  _formKey.currentState?.reset();
                                  if (mounted) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Item added!'),
                                      ),
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                'Add Item',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
