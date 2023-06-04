library brick.config.env;

import 'package:brick/src/config/error/error_messages.dart';
import 'package:brick/src/util/brick_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'env_enums.dart';

class EnvConfig {
  static final EnvConfig _instance = EnvConfig._();

  EnvConfig._() {
    BrickLogger().info(
      msg: "[EnvConfig] Created",
      block: "Singleton Constructor",
    );
  }

  factory EnvConfig() {
    return _instance;
  }

  late final EnvTarget envTarget;

  /// 환경 변수 setter
  Future init() async {
    envTarget = kReleaseMode ? EnvTarget.release : EnvTarget.develop;

    // lunch cmd에 옵션이 있었는지 확인
    String? profile = const String.fromEnvironment('env');

    // Prod가 아니면서, cmd에 옵션이 있었으면 cmd 옵션을 환경변수로 지정 (cmd == lunch.json)
    if (envTarget != EnvTarget.release && profile != '') {
      try {
        envTarget = EnvTarget.values.byName(profile.toLowerCase());
      } catch (e) {
        Exception(ErrorMessages().env(envError: EnvError.invalidEnvProfile));
      }
    }

    BrickLogger().info(msg: 'RunningMode : ${envTarget.name}', block: 'Env');

    try {
      // env 파일 로드
      await dotenv.load(fileName: "assets/env/${envTarget.name}.env");
    } catch (e) {
      throw Exception(ErrorMessages().env(envError: EnvError.missingFile));
    }
  }

  /// .env 파일에 명시된 값을 가져옵니다
  String getValue({required EnvKey envKey}) {
    return dotenv.get(envKey.toUpperCamelCase());
  }
}
