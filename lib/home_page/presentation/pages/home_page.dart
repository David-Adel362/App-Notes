import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:note/home_page/presentation/pages/note_tile.dart';
import 'package:note/home_page/presentation/widgets/custom_dialog.dart';
import 'package:note/home_page/presentation/widgets/custom_drawer.dart';
import 'package:note/models/sqldb.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Sqldb sqlDb = Sqldb();
  bool isLoading = false;
  List notes = [];


  Future<List<Map>> readData() async {
    List<Map> response = await sqlDb.readData("SELECT * FROM 'notes'");

    notes.addAll(response);
    isLoading = false;
    if (mounted) {
      setState(() {});
    }
    return response;
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    readData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: CustomDrawer(),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 22,
                    right: 22,
                    top: 0,
                    bottom: 5,
                  ),
                  child: Text(
                    'Notes',
                    style: GoogleFonts.agbalumo(
                      fontSize: 40,
                      color: Theme.of(context).colorScheme.inversePrimary,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(height: 5),
                      itemCount: notes.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 7,
                      ),
                      itemBuilder: (context, index) {
                        final item = notes[index];
                        return NoteTile(
                          item: item,
                          onDeleted: () async {
                            setState(() {
                              notes.removeWhere((e) => e['id'] == item['id']);
                              Navigator.pop(context);
                            });
                          },
                          onEdited: () async {
                            setState(() {
                              notes.clear();
                              isLoading = true;
                            });
                            await readData();
                          },
                        );
                      }),
                ),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => CustomDialog(
              sqlDb: sqlDb,
            ),
          );
          if (result == true && result) {
            setState(() {
              notes.clear();
              isLoading = true;
            });
            await readData();
          }
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
