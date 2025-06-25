import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kaloria/controller/date_controller.dart';
import 'package:kaloria/controller/diary_controller.dart';
import 'package:kaloria/controller/item_controller.dart';
import 'package:kaloria/controller/navbar_controller.dart';
import 'package:kaloria/models/item.dart';

class AddPage extends ConsumerStatefulWidget {
  final ItemEntry? item;
  const AddPage({super.key, this.item});

  @override
  ConsumerState<AddPage> createState() => _AddPageState();
}

class _AddPageState extends ConsumerState<AddPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  double _calories = 0;

  @override
  void initState() {
    super.initState();
    if (widget.item != null) {
      _name = widget.item!.name;
      _calories = widget.item!.calories;
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = ref.watch(selectedDateProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF0F2F5),
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
            return const Center(
              child: Text(
                'No diary entry for this date.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return _buildAddItemForm(diaryEntry);
        },
      ),
    );
  }

  Widget _buildAddItemForm(dynamic diaryEntry) {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 128.0,
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withValues(alpha: 0.2),
                  spreadRadius: 2,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 24),
                  _buildTextFormField(
                    labelText: 'Name',
                    initialValue: _name,
                    onSaved: (val) => _name = val ?? '',
                    validator: (val) =>
                        val == null || val.isEmpty ? 'Enter a name' : null,
                  ),
                  const SizedBox(height: 16),
                  _buildTextFormField(
                    labelText: 'Calories',
                    initialValue: _calories.toString(),
                    keyboardType: TextInputType.number,
                    onSaved: (val) =>
                        _calories = double.tryParse(val ?? '') ?? 0,
                    validator: (val) =>
                        val == null || double.tryParse(val) == null
                        ? 'Enter calories'
                        : null,
                  ),
                  const SizedBox(height: 32),
                  _buildSubmitButton(diaryEntry),
                  if (widget.item != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: _buildDeleteButton(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField({
    required String labelText,
    String? initialValue,
    TextInputType? keyboardType,
    required FormFieldSetter<String> onSaved,
    required FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      initialValue: initialValue,
      cursorColor: Colors.black87,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black87),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: Colors.black87, width: 2.0),
        ),
      ),
      keyboardType: keyboardType,
      onSaved: onSaved,
      validator: validator,
    );
  }

  Widget _buildSubmitButton(dynamic diaryEntry) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () async {
        if (!(_formKey.currentState?.validate() ?? false)) {
          return;
        }
        _formKey.currentState?.save();
        final item = ItemEntry(
          id: widget.item?.id ?? 0,
          diaryEntryId: diaryEntry.id,
          name: _name,
          calories: _calories,
          createdAt: widget.item?.createdAt ?? DateTime.now(),
        );

        if (widget.item == null) {
          await ref.read(itemEntriesNotifierProvider.notifier).addItem(item);
        } else {
          await ref.read(itemEntriesNotifierProvider.notifier).updateItem(item);
        }

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              widget.item == null ? 'Item added!' : 'Item updated!',
            ),
            duration: const Duration(seconds: 1),
          ),
        );
        ref.read(navBarProvider.notifier).collapseAll();

        if (!mounted) return;

        context.go('/home');
      },
      child: Text(
        widget.item == null ? 'Add Item' : 'Update Item',
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }

  Widget _buildDeleteButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: () async {
        await ref
            .read(itemEntriesNotifierProvider.notifier)
            .deleteItem(widget.item!.id);

        if (!mounted) return;

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Item deleted!'),
            duration: const Duration(seconds: 1),
          ),
        );
        ref.read(navBarProvider.notifier).collapseAll();

        await Future.delayed(const Duration(seconds: 1));

        if (!mounted) return;

        context.go('/home');
      },
      child: const Text(
        'Delete Item',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}
