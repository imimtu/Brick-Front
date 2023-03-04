import 'package:brick/src/config/env/env_enums.dart';
import 'package:brick/src/config/error/error_enums.dart';
import 'package:brick/src/config/error/error_messages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:just_util/just_log.dart';

import 'package:provider/provider.dart';

import 'package:brick/src/app/app.dart';
import 'package:brick/src/app/pages/home/home_controller.dart';

void main() async {
  await setEnv();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: ((context) => HomeController())),
    ],
    child: const App(),
  ));
}

///
/// 환경 변수 setter
Future<void> setEnv() async {
  try {
    String env = kReleaseMode ? EnvTarget.release.name : EnvTarget.develop.name;

    // lunch cmd에 옵션이 있었는지 확인
    String? profile = const String.fromEnvironment('env');

    // Prod가 아니면서, cmd에 옵션이 있었으면 cmd 옵션을 환경변수로 지정 (cmd == lunch.json)
    if (env != EnvTarget.release.name && profile != '') {
      env = profile;
    }

    JustLog.log('Env Setting - RunningMode : $env');

    // env 파일 로드
    await dotenv.load(fileName: "assets/env/$env.env");
  } catch (e) {
    throw Exception(ErrorMessages().env[EnvError.missingFile]);
  }
}
