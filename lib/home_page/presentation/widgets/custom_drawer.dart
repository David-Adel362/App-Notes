import 'package:flutter/material.dart';
import 'package:note/home_page/presentation/widgets/custom_drawer_tile.dart';
import 'package:note/setting_page/presentation/pages/setting_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.note,
            ),
          ),
          CustomDrawerTile(
            tile: "Notes",
            leading: Icon(Icons.home),
            onTap: () => Navigator.pop(context),
          ),
          CustomDrawerTile(
            tile: "Settings",
            leading: Icon(Icons.settings),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingPage(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
