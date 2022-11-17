import 'package:brick/pages/home/widgets/home_body.dart';
import 'package:brick/pages/home/widgets/home_drawer.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: const HomeDrawer(),
      body: const HomeBody(),
      floatingActionButton: _floatingButton(context),
    );
  }

  /// Home - AppBar
  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: Builder(builder: (context) {
        return IconButton(
          tooltip: "Drawer Button",
          icon: const Icon(
            Icons.menu,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        );
      }),
      title: const Text("Brick"),
    );
  }

  /// Home - floatingButton
  Widget _floatingButton(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Additional Button',
      child: const Icon(Icons.add_task),
      onPressed: () {},
    );
  }
}
