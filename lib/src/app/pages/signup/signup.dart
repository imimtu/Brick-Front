import 'package:brick/src/app/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUp extends StatefulWidget {
  static const String path = "/auth/signup";
  static const String name = "signup";

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  context.go(Login.path);
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
