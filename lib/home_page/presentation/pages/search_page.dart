import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note/home_page/presentation/widgets/custom_search_bar.dart';

import 'note_tile.dart';

class SearchPage extends StatefulWidget {
  final Function(List<Map>) onSearch;
  List<Map> notes;

  SearchPage({
    super.key,
    required this.notes,
    required this.onSearch,
  });

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchController = TextEditingController();
  List<Map> filteredNotes = [];

  @override
  void initState() {
    super.initState();
    filteredNotes = widget.notes;
  }

  void _filterNotes(String query) {
    setState(() {
      filteredNotes = widget.notes
          .where((note) =>
              note['title'] != null && note['title'].toLowerCase().contains(query.toLowerCase()) ||
              note['content'] != null && note['content'].toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Search Notes"),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 18,
          right: 18,
          top: 10,
          bottom: 0,
        ),
        child: Column(
          children: [
            CustomSearchBar(
              onSearch: (query) {
                setState(() {
                  searchController.text = query;
                  _filterNotes(query);
                  widget.onSearch(filteredNotes);
                });
              },
              notes: widget.notes,
            ),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(height: 5),
                  itemCount: filteredNotes.length,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 0,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredNotes[index];
                    return NoteTile(
                      item: item ?? {Text: 'not found'},
                      onDeleted: () async {
                        setState(() {
                          widget.notes.removeWhere((e) => e['id'] == item['id']);
                          widget.onSearch(widget.notes);
                        });
                        Future.delayed(Duration(milliseconds: 200), () {
                          Navigator.pop(context);
                        });
                      },
                      onEdited: () async {
                        setState(() {});
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
