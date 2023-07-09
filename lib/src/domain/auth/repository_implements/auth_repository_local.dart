import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/auth/repositories/auth_repository.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';

class AuthRepositoryLocal extends AuthRepository {
  @override
  Future<APIResult> login(RequestEntity<LoginRequestValue> requestEntity) {
    // TODO: implement login
    throw UnimplementedError();
  }
}
