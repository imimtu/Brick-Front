import 'package:brick/models/todo/todo_item.dart';
import 'package:brick/pages/home/home_controller.dart';
import 'package:brick/pages/pages.dart';
import 'package:brick/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      floatingActionButton: _floatingActionButton(context),
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
    TextEditingController textEditingController = TextEditingController();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context
                        .read<HomeController>()
                        .addItem(title: textEditingController.text);
                    textEditingController.text = "";
                  },
                  icon: const Icon(Icons.add),
                ),
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    onSubmitted: (val) {
                      context.read<HomeController>().addItem(title: val);
                      textEditingController.text = "";
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: context.watch<HomeController>().toDoList.length,
                  itemBuilder: (context, index) {
                    return Builder(
                      builder: (context) {
                        ToDoItem toDoItem = context
                            .watch<HomeController>()
                            .toDoList
                            .itemAt(index);

                        return ToDoTile(
                          isChecked: toDoItem.isComplete,
                          checkOnChnaged: (val) {
                            context
                                .read<HomeController>()
                                .changeComplteState(index: index, val: val!);
                          },
                          title: toDoItem.title,
                          onDelete: () {
                            context
                                .read<HomeController>()
                                .deleteItem(index: index);
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      tooltip: "To Do 등록",
      onPressed: () {
        Navigator.of(context).pushNamed(path[PATH.todo]!);
      },
      child: Transform.scale(
        scale: 1.4,
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }
}
