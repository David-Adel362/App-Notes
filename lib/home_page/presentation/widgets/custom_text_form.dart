import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final TextEditingController text;
  final String hintText;
  final TextInputType? inputType;
  final int? maxLines;

  const CustomTextForm({
    super.key,
    required this.text,
    required this.hintText,
    this.inputType,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: maxLines,
      keyboardType: inputType,
      style: TextStyle(
        fontSize: 16,
        color: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Theme.of(context).colorScheme.background,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Title is required';
        return null;
      },
      controller: text,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(),
      ),
    );
  }
}
