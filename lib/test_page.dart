// // import 'package:flutter/material.dart';
// // import 'package:note/models/sqldb.dart';
// //
// // class TestPage extends StatefulWidget {
// //   const TestPage({super.key});
// //
// //   @override
// //   State<TestPage> createState() => _TestPageState();
// // }
// //
// // class _TestPageState extends State<TestPage> {
// //   Sqldb sqldb = Sqldb();
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: Center(
// //         child: Column(
// //           children: [
// //             MaterialButton(
// //               onPressed: () async {
// //                 int response = await sqldb.insertData(
// //                   '''INSERT INTO 'notes' ('note', 'title', 'color')
// //                                 VALUES (?, ?, ?)''',
// //                   [note.text, title.text, color.text],
// //                 );
// //                 print('------------------------->$response');
// //               },
// //               color: Colors.red,
// //               child: Text('insert data'),
// //             ),
// //             MaterialButton(
// //               onPressed: () async {
// //                 List<Map> response = await sqldb.readData(
// //                   "SELECT * FROM 'notes' ",
// //                 );
// //                 print("------------------------->$response");
// //               },
// //               color: Colors.green,
// //               child: Text('read data'),
// //             ),
// //             MaterialButton(
// //               onPressed: () async {
// //                 int response = await sqldb.deleteData(
// //                   "DELETE FROM 'notes' WHERE id = 10 ",
// //                 );
// //                 print('------------------------->$response');
// //               },
// //               color: Colors.red,
// //               child: Text('Delete data'),
// //             ),
// //             MaterialButton(
// //               onPressed: () async {
// //                 int response = await sqldb.updateData(
// //                   "UPDATE 'notes' SET note =  'note tttttt' WHERE id = 9",
// //                 );
// //                 print('------------------------->$response');
// //               },
// //               color: Colors.red,
// //               child: Text('Update data'),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
// //
// // MaterialButton(
// // onPressed: () async {
// // if (formState.currentState!.validate()) {
// // try {
// // Database? db = await sqlDb.db;
// // if (db == null) {
// // print("Database is not open.");
// // db = await sqlDb.initialDb();
// // if (db == null) {
// // print("Failed to open the database.");
// // return;
// // }
// // }
// //
// // // إذا كانت قاعدة البيانات مفتوحة، نفذ عملية الإدخال
// // int response = await sqlDb.insertData(
// // '''INSERT INTO 'notes' ('note', 'title', 'color')
// //                                 VALUES (?, ?, ?)''',
// // [note.text, title.text, color.text],
// // );
// //
// // print('-----------------------> $response');
// // print('----------------------response successssssssssss');
// //
// // // إذا كانت العملية ناجحة، قم بتصفير الحقول
// // if (response != 0) {
// // note.clear();
// // title.clear();
// // color.clear();
// // }
// // } catch (e) {
// // print("Error: $e");
// // }
// // }
// // },
// // textColor: Colors.white,
// // color: Colors.black,
// // child: Text(
// // 'Add Note',
// // ),
// // ),
//
//
//
//
// Card(
// child: ListTile(
// title: Text("${item['note']}"),
// trailing: Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// CustomIconDelete(
// id: item['id'],
// sqlDb: sqlDb,
// onDeleted: () {
// setState(() {
// notes.removeWhere((element) => element['id'] == item['id']);
// });
// },
// ),
// CustomIconEditing(
// note: item,
// onEdited: () async {
// setState(() {
// notes.clear();
// isLoading = true;
// });
// await readData();
// },
// ),
// ],
// ),
// ),
// )