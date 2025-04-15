import 'package:flutter/material.dart';

class CustomDrawerTile extends StatelessWidget {
  final String tile;
  final Widget leading;
  final GestureTapCallback? onTap;

  const CustomDrawerTile({
    super.key,
    required this.tile,
    required this.leading,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15),
      child: ListTile(
        title: Text(
          tile,
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        leading: leading,
        onTap: onTap,
      ),
    );
  }
}
