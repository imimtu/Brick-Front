import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/signup/signup.dart';
import 'package:brick/src/app/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String path = "/auth/login";
  static const String name = "login";

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
                  Provider.of<AuthProvider>(context, listen: false)
                      .login()
                      .then((value) {
                    context.go(Home.path);
                  });
                },
                child: const Text("Login"),
              ),
              TextButton(
                onPressed: () {
                  context.go(SignUp.path);
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
