part of brick.config.api;

abstract class APIRoutes {
  /// Base Routes
  static const String baseRouteV1 = "/api/v1";

  /// Auth
  static const String login = "$baseRouteV1/users/login"; // [POST] 로그인
  static const String validateToken = "";
  static const String join = "$baseRouteV1/users/join"; // [POST] 회원 가입
}
