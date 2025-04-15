import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/home_page/presentation/widgets/custom_edit_button.dart';
import 'package:note/models/sqldb.dart';
import 'package:note/share_widgets/custom_chose_color.dart';

import '../../../home_page/presentation/pages/home_page.dart';
import '../../../home_page/presentation/widgets/custom_text_form.dart';

class EditeNotes extends StatefulWidget {
  final String note;
  final String title;
  final int id;
  final Color color;

  const EditeNotes({
    super.key,
    required this.note,
    required this.title,
    required this.id,
    required this.color,
  });

  @override
  State<EditeNotes> createState() => _EditeNotesState();
}

class _EditeNotesState extends State<EditeNotes> {
  Sqldb sqlDb = Sqldb();

  GlobalKey<FormState> formState = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController colorController = TextEditingController();

  late Color selectedColor;

  @override
  void initState() {
    note.text = widget.note;
    title.text = widget.title;
    selectedColor = widget.color;
    colorController.text = selectedColor.value.toString();
    super.initState();
  }

  void onColorSelected(Color color) {
    setState(() {
      selectedColor = color;
      colorController.text = selectedColor.value.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Edite Notes',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false,
            );
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: ListView(
        children: [
          Form(
            key: formState,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 18, right: 18, bottom: 0),
              child: Column(
                children: [
                  CustomTextForm(
                    text: note,
                    hintText: 'Note',
                    inputType: TextInputType.text,
                    maxLines: 1,
                  ),
                  SizedBox(height: 30),
                  CustomTextForm(
                    text: title,
                    hintText: 'Title',
                    inputType: TextInputType.multiline,
                    maxLines: null,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height / 1.55,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomEditButton(
                        note: note,
                        title: title,
                        sqlDb: sqlDb,
                        id: widget.id,
                        formState: formState,
                        color: selectedColor,
                      ),
                      CustomChoseColor(
                        selectedColor: selectedColor,
                        onColorSelected: onColorSelected,
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
