import 'package:flutter/material.dart';
import 'package:note/home_page/presentation/widgets/custom_pop_menu.dart';

class NoteTile extends StatelessWidget {
  final Map item;

  final VoidCallback onDeleted;
  final VoidCallback onEdited;

  const NoteTile({
    super.key,
    required this.item,
    required this.onDeleted,
    required this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    Color noteColor;
    if (item['color'] != null && item['color'].toString().isNotEmpty) {
      try {
        noteColor = Color(int.tryParse(item['color'].toString()) ?? Colors.cyanAccent.value);
      } catch (e) {
        noteColor = Colors.blue;
      }
    } else {
      noteColor = Colors.blue;
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        color: noteColor,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 5,
      ),
      child: ListTile(
        title: Text(item['note']),
        subtitle: Text(item['title']),
        trailing: CustomPopMenu(
          item: item,
          onDeleted: onDeleted,
          onEdited: onEdited,
        ),
      ),
    );
  }
}
