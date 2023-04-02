import 'package:flutter/material.dart';

class BrickDetail extends StatelessWidget {
  static String path = "/brick";

  const BrickDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: const Text("Brick"),
    );
  }
}
