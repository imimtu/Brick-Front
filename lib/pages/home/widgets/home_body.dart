import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
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
}
