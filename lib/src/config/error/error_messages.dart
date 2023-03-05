import 'package:brick/src/config/error/error_enums.dart';
import 'package:brick/src/util/brick_logger.dart';

class ErrorMessages {
  static final ErrorMessages _instance = ErrorMessages._internal();

  ErrorMessages._internal() {
    BrickLogger().info(msg: 'ErrorMessages Class Created');
  }

  factory ErrorMessages() {
    return _instance;
  }

  Map<EnvError, String> env = {
    EnvError.missingFile: "./assets/env/ 위치에 .env 파일이 존재하지 않습니다.",
  };
}
