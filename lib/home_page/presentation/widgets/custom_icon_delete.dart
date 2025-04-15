import 'package:flutter/material.dart';
import 'package:note/models/sqldb.dart';

class CustomIconDelete extends StatelessWidget {
  final int id;
  final Function onDeleted;
  final Sqldb sqlDb;

  const CustomIconDelete({
    super.key,
    required this.id,
    required this.onDeleted,
    required this.sqlDb,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        int response = await sqlDb.deleteData("DELETE FROM 'notes' WHERE id = $id");
        if (response > 0) {
          onDeleted();
        }
      },
      icon: Icon(Icons.delete_outline, color: Colors.red),
    );
  }
}
