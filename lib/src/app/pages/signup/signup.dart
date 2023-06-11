import 'package:brick/src/app/app.dart';
import 'package:brick/src/app/pages/login/login.dart';
import 'package:brick/src/app/providers/auth_provider.dart';
import 'package:brick/src/app/styles/styles.dart';
import 'package:brick/src/util/brick_logger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  static const String path = "/auth/signup";
  static const String name = "signup";

  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailTextCtrl = TextEditingController();
  final TextEditingController passwordTextCtrl = TextEditingController();
  final TextEditingController passwordReenterTextCtrl = TextEditingController();

  bool _passwordObscure = true;
  bool _passwordReenterObscrue = true;

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

    return Scaffold(
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
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(fontWeight: FontWeight.w700, color: textColor),
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
                        "회원가입",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
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
                  obscureText: _passwordObscure,
                  decoration: InputDecoration(
                      labelText: "비밀번호",
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordObscure = !_passwordObscure;
                          });
                        },
                        icon: _passwordObscure
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                      )),
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

                // 비밀번호 재입력
                TextFormField(
                  controller: passwordReenterTextCtrl,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: _passwordReenterObscrue,
                  decoration: InputDecoration(
                    labelText: "비밀번호 재입력",
                    border: const OutlineInputBorder(),
                    focusedBorder: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _passwordReenterObscrue = !_passwordReenterObscrue;
                        });
                      },
                      icon: _passwordReenterObscrue
                          ? const Icon(Icons.visibility)
                          : const Icon(Icons.visibility_off),
                    ),
                  ),
                  onFieldSubmitted: (value) {
                    BrickLogger()
                        .info(msg: 'password - onFieldSubmitted // $value');
                  },
                  validator: (value) {
                    if (value == null || value == '') {
                      return '비밀번호를 다시 입력해주세요.';
                    }

                    if (value != passwordTextCtrl.text) {
                      return "입력하신 비밀번호화 일치하지 않습니다.";
                    }

                    return null;
                  },
                ),
                SizedBox(height: gapUnit * 3),

                SizedBox(
                  width: bodyWidth,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                        ),
                        onPressed: () {
                          context.pop();
                        },
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Provider.of<AuthProvider>(context, listen: false)
                                  .signUp(
                                userId: emailTextCtrl.text,
                                userPassword: passwordTextCtrl.text,
                              )
                                  .then((value) {
                                context.goNamed(Login.name);
                              });
                            }
                          },
                          child: const Text("회원가입"),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
