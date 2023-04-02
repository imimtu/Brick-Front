import 'package:brick/src/app/pages/pages.dart';
import 'package:brick/src/app/pages/signup/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String path = "/login";

  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, Home.path);
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SignUp.path);
                },
                child: const Text("회원가입"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
