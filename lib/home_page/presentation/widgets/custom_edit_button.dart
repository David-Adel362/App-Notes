import 'package:flutter/material.dart';

import '../../../models/sqldb.dart';
import '../pages/home_page.dart';

class CustomEditButton extends StatelessWidget {
  final TextEditingController note;
  final TextEditingController title;
  final GlobalKey<FormState>? formState;
  final Sqldb sqlDb;
  final int id;
  final Color color;

  const CustomEditButton({
    super.key,
    required this.note,
    required this.title,
    required this.sqlDb,
    required this.id,
    this.formState,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 250,
      animationDuration: Duration(microseconds: 1),
      onPressed: () async {
        if (formState?.currentState!.validate() ?? false) {
          try {
            Map<String, Object?> updatedData = {
              'note': note.text,
              'title': title.text,
              'color': color.value,
            };

            int response = await sqlDb.update(
              'notes',
              updatedData,
              'id = $id',
            );

            if (response > 0) {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
              );
            } else {}
          } catch (e) {}
        }
      },
      textColor: Theme.of(context).colorScheme.inversePrimary,
      color: Theme.of(context).colorScheme.primary,
      child: const Text('Update Note'),
    );
  }
}
