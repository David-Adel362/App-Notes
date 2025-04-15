import 'package:flutter/material.dart';
import 'package:note/home_page/presentation/widgets/custom_menu_item.dart';
import 'package:popover/popover.dart';

class CustomPopMenu extends StatelessWidget {
  const CustomPopMenu({
    super.key,
    required this.item,
    required this.onDeleted,
    required this.onEdited,
  });

  final Map item;
  final VoidCallback onDeleted;
  final VoidCallback onEdited;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => showPopover(
        context: context,
        bodyBuilder: (context) => CustomMenuItem(
          item: item,
          onDeleted: onDeleted,
          onEdited: onEdited,
        ),
        width: 100,
        height: 50,
        backgroundColor: Theme.of(context).colorScheme.primary,
        direction: PopoverDirection.top,
      ),
      child: Icon(
        Icons.more_vert_outlined,
        color: Theme.of(context).colorScheme.inversePrimary,
      ),
    );
  }
}
