import 'package:brick/src/domain/models/brick.dart';
import 'package:brick/src/app/pages/home/home_controller.dart';
import 'package:brick/src/app/pages/pages.dart';
import 'package:brick/src/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static String path = "/home";

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
      onTap: _getOffFocus,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.builder(
                  itemCount: context.watch<HomeController>().brickList.length,
                  itemBuilder: (context, index) {
                    return Builder(
                      builder: (context) {
                        Brick brick =
                            context.watch<HomeController>().brickList[index];

                        return BrickTile(
                          isChecked: brick.isCompleted,
                          checkOnChnaged: (val) {
                            if (val != null) {
                              brick.isCompleted = val;
                              // context
                              //     .read<HomeController>()
                              //     .changeComplteState(index: index, val: val);
                            }
                          },
                          title: brick.title,
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
      padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
      height: homeFocusNode.hasFocus ? 90.0 : 0.0,
      color: Colors.grey,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Scrollbar(
            thumbVisibility: true,
            child: TextField(
              focusNode: homeFocusNode,
              controller: textEditingController,
              maxLines: 1,
              decoration: const InputDecoration(
                hintText: "Title",
                border: InputBorder.none,
              ),
              onSubmitted: (val) {
                _addToDo(val);
              },
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _floatingActionButton(BuildContext context) {
    return FloatingActionButton(
      tooltip: "Brick 등록",
      onPressed: _getFocus,
      child: Transform.scale(
        scale: 1.4,
        child: const Icon(Icons.add_task_rounded),
      ),
    );
  }

  void _getFocus() {
    // TODO(Kangmin): Focus 제거 시 동작 정의
    homeFocusNode.requestFocus();
  }

  void _getOffFocus() {
    // TODO(Kangmin): Focus 제거 시 동작 정의
    homeFocusNode.unfocus();

    _addToDo(textEditingController.text);
  }

  void _addToDo(String val) {
    context.read<HomeController>().addItem(title: val);
    textEditingController.text = "";
  }
}
