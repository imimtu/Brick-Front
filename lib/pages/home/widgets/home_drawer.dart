import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text("Drawer"),
          ),
          ListTile(
            title: const Text("Menu1"),
            onTap: () {},
          ),
          ListTile(
            title: const Text("Menu2"),
            onTap: () {},
          )
        ],
      ),
    );
  }
}
