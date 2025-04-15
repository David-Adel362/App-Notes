import 'package:flutter/material.dart';

import '../../../edit_note/presentation/pages/edit_notes.dart';

class CustomIconEditing extends StatelessWidget {
  final Map note;
  final Function onEdited;

  const CustomIconEditing({
    super.key,
    required this.note,
    required this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        Navigator.pop(context);
        final editing = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => EditeNotes(
              color: Color(int.tryParse(note['color']) ?? Colors.cyanAccent.value),
              note: note['note'],
              title: note['title'],
              id: note['id'],
            ),
          ),
        );
        if (editing == true) {
          onEdited();
        }
      },
      icon: Icon(
        Icons.edit_note_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
