import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/auth/entities/token/valid_token_request_value.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';

abstract class AuthRepository {
  /// 로그인
  Future<APIResult> login(RequestEntity<LoginRequestValue> requestEntity);

  /// 토큰 유효성 검사
  Future<APIResult> validateToken(
    RequestEntity<ValidateTokenRequestValue> requestEntity,
  );
}
