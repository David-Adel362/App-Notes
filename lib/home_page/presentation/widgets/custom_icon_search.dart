import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomIconSearch extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomIconSearch({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        CupertinoIcons.search,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
