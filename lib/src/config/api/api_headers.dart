part of brick.config.api;

abstract class APIHeader {
  /// cors 허용 헤더
  static const Map<String, String> cors = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "*",
  };

  /// chrome 허용 헤더
  static const Map<String, String> chrome = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "DELETE,GET,OPTIONS,PATCH,POST,PUT",
    "content-type": "application/json",
  };

  /// json 전송 헤더
  static const Map<String, String> json = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "*",
    "content-type": "application/json",
  };

  /// image 전송 헤더
  static const Map<String, String> image = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "*",
    "content-type": "image/jpeg",
  };
}
