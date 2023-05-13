import 'package:brick/src/app/pages/home/home.dart';
import 'package:brick/src/app/pages/login/login.dart';
import 'package:brick/src/app/pages/signup/signup.dart';
import 'package:brick/src/app/pages/splash/splash.dart';
import 'package:brick/src/app/providers/auth_provider.dart';
import 'package:brick/src/app/providers/brick_provider.dart';
import 'package:flutter/material.dart';
import 'package:brick/src/app/styles/styles.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  static const String title = "BRICK";

  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => BrickProvider()),
      ],
      builder: (context, child) {
        return MaterialApp.router(
          title: title,
          theme: BrickTheme.basic,
          darkTheme: BrickTheme.dark,
          debugShowCheckedModeBanner: false,
          routerConfig: GoRouter(
            routes: <GoRoute>[
              // Splash (진입 경로)
              GoRoute(
                path: Splash.path,
                name: Splash.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const Splash(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  );
                },
              ),

              // ---------- * Auth * ----------
              // Login
              GoRoute(
                path: Login.path,
                name: Login.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const Login(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  );
                },
              ),
              // SignUp
              GoRoute(
                path: SignUp.path,
                name: SignUp.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const SignUp(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  );
                },
              ),

              // ---------- * Main * ----------
              // Home
              GoRoute(
                path: Home.path,
                name: Home.name,
                pageBuilder: (context, state) {
                  return CustomTransitionPage(
                    child: const Home(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                  );
                },
              ),
            ],
            redirect: (context, state) {
              AuthProvider authProvider =
                  Provider.of<AuthProvider>(context, listen: false);

              bool isSplashRunned = Splash.isSplashRunned; // Splash 화면 실행 여부
              bool isLogined = authProvider.isLogined; // 로그인 여부
              bool toAuth =
                  state.location.contains("/auth"); // 회원 가입 / 로그인 화면으로의 이동 여부
              bool toSplash =
                  state.location == Splash.path; // Splash 화면으로의 이동 여부

              if (!isSplashRunned) {
                return null;
              }

              if (!isLogined) {
                if (toAuth) {
                  return null;
                }

                return Login.path;
              }

              if (toSplash) {
                return Home.path;
              }

              return null;
            },
            refreshListenable: Provider.of<AuthProvider>(context),
          ),
        );
      },
    );
  }
}
