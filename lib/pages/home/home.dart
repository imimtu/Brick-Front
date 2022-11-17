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
                      title: const Text("title"),
                      subtitle: const Text("subtitle"),
                      trailing: const Text("trailing"),
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
