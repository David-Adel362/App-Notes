import 'package:flutter/cupertino.dart';

import '../../../models/sqldb.dart';
import 'custom_icon_delete.dart';
import 'custom_icon_editing.dart';

class CustomMenuItem extends StatelessWidget {
  final Map item;
  final VoidCallback onDeleted;
  final VoidCallback onEdited;

  const CustomMenuItem({
    super.key,
    required this.item,
    required this.onDeleted,
    required this.onEdited,
  });

  @override
  Widget build(BuildContext context) {
    final Sqldb sqlDb = Sqldb();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomIconEditing(
          note: item,
          onEdited: onEdited,
        ),
        CustomIconDelete(
          id: item['id'],
          sqlDb: sqlDb,
          onDeleted: onDeleted,
        ),
      ],
    );
  }
}
