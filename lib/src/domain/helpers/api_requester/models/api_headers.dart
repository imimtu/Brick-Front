part of brick.domain.helpers.api_requester;

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
    "Content-Type": "application/json",
  };

  /// json 전송 헤더
  static const Map<String, String> json = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "*",
    "Content-Type": "application/json",
  };

  /// image 전송 헤더
  static const Map<String, String> image = {
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Request-Headers": "*",
    "Access-Control-Resqust-Method": "*",
    "Content-Type": "image/jpeg",
  };
}
