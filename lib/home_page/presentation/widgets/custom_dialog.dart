import 'package:flutter/material.dart';
import 'package:note/add_note/presentation/pages/add_notes.dart';
import '../../../models/sqldb.dart';
import 'custom_text_form.dart';

class CustomDialog extends StatelessWidget {
  final Sqldb sqlDb;

  const CustomDialog({
    super.key,
    required this.sqlDb,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController noteController = TextEditingController();
    // TextEditingController titleController = TextEditingController();
    // Color selectedColor = Colors.blue;
    // GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextForm(
            hintText: 'Note',
            text: noteController,
            maxLines: 1,
          ),
          SizedBox(height: 20),
          MaterialButton(
            height: 50,
            minWidth: 300,
            animationDuration: Duration(microseconds: 1),
            color: Theme.of(context).colorScheme.inversePrimary,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddNotes(),
                  settings: RouteSettings(
                    arguments: noteController.text,
                  ),
                ),
              );
            },
            child: Text(
              'Next',
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          // CustomCreateNote(
          //   selectedColor: selectedColor.toString(),
          //   note: noteController,
          //   title: titleController,
          //   formState: formKey,
          //   sqlDb: sqlDb,
          // ),
        ],
      ),
    );
  }
}
