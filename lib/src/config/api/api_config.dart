library brick.config.api;

import 'package:brick/src/util/brick_logger.dart';

part 'api_routes.dart';

class APIConfig {
  static final APIConfig _instance = APIConfig._();

  APIConfig._() {
    BrickLogger().info(
      msg: "[APIConfig] Created",
      block: "Singleton Constructor",
    );
  }

  factory APIConfig() {
    return _instance;
  }

  /// API 요청 Domain 경로
  String? host;

  // Initialize API Configs
  void init({
    String? host,
  }) {
    BrickLogger().info(msg: 'host : $host', block: 'API Config');

    _instance.host = host ?? _instance.host;
  }
}
