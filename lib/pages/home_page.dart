import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: _drawer(context),
      body: _body(context),
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

  /// Home - Drawer
  Widget _drawer(BuildContext context) {
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

  /// Home - Body
  Widget _body(BuildContext context) {
    DateTime now = DateTime.now();
    String today =
        "${now.year}.${now.month < 10 ? '0${now.month}' : now.month}.${now.day < 10 ? '0${now.day}' : now.day}";
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [Text(today)],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: ((context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                    child: ListTile(
                      leading: Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Checkbox(
                          onChanged: (bool? value) {},
                          value: false,
                        ),
                      ),
                      title: Text("title"),
                      subtitle: Text("subtitle"),
                      trailing: Text("trailing"),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
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
