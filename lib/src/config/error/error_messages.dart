library brick.config.error;

import 'package:brick/src/util/brick_logger.dart';

part 'error_enums.dart';

class ErrorMessages {
  static final ErrorMessages _instance = ErrorMessages._internal();

  ErrorMessages._internal() {
    BrickLogger().info(msg: 'ErrorMessages Class Created');
  }

  factory ErrorMessages() {
    return _instance;
  }

  /// 환경 변수 관련 에러 메세지
  String env({required EnvError envError}) {
    String result = "";

    switch (envError) {
      case EnvError.invalidEnvProfile:
        result = "env 입력 값이 올바르지 않습니다. (허용 env: local / develop / release)";
        break;
      case EnvError.missingFile:
        result = "./assets/env/ 위치에 .env 파일이 존재하지 않습니다.";
        break;
    }

    return result;
  }
}
