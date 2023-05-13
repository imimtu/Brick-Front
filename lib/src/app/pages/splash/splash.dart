import 'package:brick/src/app/app.dart';
import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatefulWidget {
  static const String path = "/";
  static const String name = "splash";

  static bool isSplashRunned = false;

  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // Splash 화면 빌드 후 진입 화면 결정을 위해 함수 호출
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _afterBuild();
    });

    Color scaffoldColor = BrickColors.white;
    Color textColor = BrickColors.black;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;

    if (isDarkMode) {
      scaffoldColor = BrickColors.black;
      textColor = BrickColors.white;
    }

    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            App.title,
            style: TextStyle(
              color: textColor,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Future<void> _afterBuild() async {
    await _showSplash().then((value) {
      // TODO: 자동 로그인 로직 후 화면 이동

      context.go(Home.path);
    });
  }

  Future<bool> _showSplash() {
    return Future.delayed(const Duration(seconds: 2, milliseconds: 100), () {
      Splash.isSplashRunned = true;
      return Splash.isSplashRunned;
    });
  }
}
