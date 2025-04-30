import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({super.key, required this.onSearch, required this.notes});

  final Function(String) onSearch;
  List<Map> notes;

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Theme.of(context).colorScheme.inversePrimary,
      style: TextStyle(
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
      controller: searchController,
      onChanged: (query) {
        onSearch(query);
      },
      decoration: InputDecoration(
        labelText: 'Search Notes',
        border: OutlineInputBorder(),
      ),
    );
  }
}
