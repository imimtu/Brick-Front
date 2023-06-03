import 'dart:async';

import 'package:brick/src/app/app.dart';
import 'package:brick/src/config/env/env_config.dart';
import 'package:brick/src/util/brick_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      setErrorDetector();

      EnvConfig().init();

      runApp(const App());
    },
    (error, stack) {
      BrickLogger().error(msg: "$error");
    },
  );
}

/// Set Flutter Error Detecting
void setErrorDetector() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) {
      // ToDo(kangmin): 슬랙 API 연결을 통해 상용 모드 에러 리포팅
      BrickLogger().error(msg: details.exceptionAsString());
    } else {
      BrickLogger().error(msg: details.exceptionAsString());
    }
  };
}
