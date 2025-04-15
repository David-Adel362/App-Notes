import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import '../../../models/sqldb.dart';

class CustomCreateNote extends StatelessWidget {
  final TextEditingController note;
  final TextEditingController title;
  final GlobalKey<FormState>? formState;
  final Sqldb sqlDb;
  final Color selectedColor;
  final VoidCallback? onNoteAdded;

  const CustomCreateNote({
    super.key,
    required this.note,
    this.formState,
    required this.sqlDb,
    required this.title,
    required this.selectedColor,
    this.onNoteAdded,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 50,
      minWidth: 300,
      animationDuration: Duration(microseconds: 1),
      onPressed: () async {
        if (formState?.currentState!.validate() ?? false) {
          try {
            Database? db = await sqlDb.db;
            if (db == null) {
              db = await sqlDb.initialDb();
              if (db == null) {
                print("Failed to open the database.");
                return;
              }
            }

            int response = await sqlDb.insert(
              "notes",
              {
                "note": note.text,
                "title": title.text,
                "color": selectedColor.value,
              },
            );

            if (response > 0) {
              Future.delayed(Duration(milliseconds: 100), () {
                Navigator.of(context).pop(true);
                onNoteAdded!();
                note.clear();
                title.clear();
              });
            }
          } catch (e) {
            print("Error: $e");
          }
        }
      },
      textColor: Theme.of(context).colorScheme.inversePrimary,
      color: Theme.of(context).colorScheme.primary,
      child: const Text(
        'Create Note',
      ),
    );
  }
}
