import 'package:brick/src/app/pages/home/home.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static String path = "/splash";

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

    return const Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Brick.\nYour growth partner.",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  /// Splash 화면 빌드 후에 동작할 함수
  Future<void> _afterBuild() async {
    Future.delayed(const Duration(seconds: 2, milliseconds: 200), () {
      Navigator.pop(context);

      // TODO: 인증 로직 이후 화면 전환
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return const Home();
        }),
      );
    });
  }
}
