import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';

abstract class AuthRepository {
  /// 로그인
  Future<APIResult> login(RequestEntity<LoginRequestValue> requestEntity);
}
