import 'package:flutter/material.dart';

import '../../../home_page/presentation/widgets/custom_create_note.dart';
import '../../../home_page/presentation/widgets/custom_text_form.dart' show CustomTextForm;
import '../../../models/sqldb.dart';
import '../../../share_widgets/custom_chose_color.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();

  Sqldb sqlDb = Sqldb();

  Color selectedColor = Colors.cyanAccent;

  void onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final noteFromArgs = ModalRoute.of(context)?.settings.arguments as String?;
    if (noteFromArgs != null) {
      note.text = noteFromArgs;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Add Notes',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CustomTextForm(
                    text: note,
                    hintText: 'Note',
                    inputType: TextInputType.text,
                  ),
                  SizedBox(height: 30),
                  CustomTextForm(
                    text: title,
                    hintText: 'Title',
                    inputType: TextInputType.multiline,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomCreateNote(
                        title: title,
                        selectedColor: selectedColor,
                        formState: formState,
                        note: note,
                        sqlDb: sqlDb,
                        onNoteAdded: () {
                          Navigator.of(context).pop(true);
                        },
                      ),
                      CustomChoseColor(
                        selectedColor: selectedColor,
                        onColorSelected: (color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
