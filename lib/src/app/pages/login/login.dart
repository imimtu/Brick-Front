import 'package:brick/src/app/app.dart';
import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/signup/signup.dart';
import 'package:brick/src/app/providers/auth_provider.dart';
import 'package:brick/src/app/styles/ddl/ddl.dart';
import 'package:brick/src/util/brick_logger.dart';
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
  final Key _formKey = GlobalKey<FormState>();

  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double bodyWidth = 300;

    double gapUnit = 8;

    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    Color textColor = BrickColors.black;

    if (isDarkMode) {
      textColor = BrickColors.white;
    }

    return WillPopScope(
      onWillPop: () async {
        // Android 뒤로가기 버튼 무효 처리.
        return false;
      },
      child: Scaffold(
        body: Center(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKey,
            child: Container(
              width: bodyWidth,
              padding: EdgeInsets.all(gapUnit),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    App.title,
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.w700, color: textColor),
                  ),
                  SizedBox(
                    height: gapUnit * 4,
                  ),

                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: BrickColors.black,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          left: BrickSize.marginSide * 2,
                          right: BrickSize.marginSide * 2,
                        ),
                        child: Text(
                          "로그인",
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: textColor,
                                  ),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          thickness: 1.0,
                          color: BrickColors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: gapUnit * 4,
                  ),

                  // 이메일
                  TextFormField(
                    controller: emailTextCtrl,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: "이메일",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      BrickLogger()
                          .info(msg: 'email - onFieldSubmitted // $value');
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return '이메일을 입력해주세요.';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: gapUnit * 2),

                  // 비밀번호
                  TextFormField(
                    controller: passwordTextCtrl,
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(
                      labelText: "비밀번호",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      BrickLogger()
                          .info(msg: 'password - onFieldSubmitted // $value');
                    },
                    validator: (value) {
                      if (value == null || value == '') {
                        return '비밀번호를 입력해주세요.';
                      }

                      return null;
                    },
                  ),
                  SizedBox(height: gapUnit * 3),

                  SizedBox(
                    width: bodyWidth,
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<AuthProvider>(context, listen: false)
                            .login(
                          email: emailTextCtrl.text,
                          userPassword: passwordTextCtrl.text,
                        )
                            .then((value) {
                          context.go(Home.path);
                        });
                      },
                      child: const Text("로그인"),
                    ),
                  ),
                  SizedBox(height: gapUnit),

                  TextButton(
                    onPressed: () {
                      context.push(SignUp.path);
                    },
                    child: const Text("회원가입"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
