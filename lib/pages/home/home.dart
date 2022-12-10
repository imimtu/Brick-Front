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
  late FocusNode homeFocusNode;
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();

    homeFocusNode = FocusNode();
    textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    homeFocusNode.dispose();
    textEditingController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      drawer: _drawer(context),
      body: _body(context),
      bottomSheet: _bottomSheet(context),
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
    return GestureDetector(
      onTap: getOffFocus,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
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

  Widget _bottomSheet(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      height: homeFocusNode.hasFocus ? 70.0 : 0.0,
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      child: TextField(
        focusNode: homeFocusNode,
        controller: textEditingController,
        onSubmitted: (val) {
          context.read<HomeController>().addItem(title: val);
          textEditingController.text = "";
        },
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      tooltip: "To Do 등록",
      onPressed: getFocus,
      child: Transform.scale(
        scale: 1.4,
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }

  void getFocus() {
    // TODO(Kangmin): Focus 제거 시 동작 정의
    homeFocusNode.requestFocus();
  }

  void getOffFocus() {
    // TODO(Kangmin): Focus 제거 시 동작 정의
    homeFocusNode.unfocus();
  }
}
