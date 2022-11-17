import 'package:flutter/material.dart';
import 'package:brick/pages/pages.dart';
import 'package:brick/styles/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HomeController())),
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Brick',
      home: const Home(),
      theme: basicTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
