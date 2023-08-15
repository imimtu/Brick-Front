import 'package:brick/src/config/api/api_config.dart';
import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/auth/entities/token/valid_token_request_value.dart';
import 'package:brick/src/domain/auth/repositories/auth_repository.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/api_requester/implements/api_requester_http.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryRemote extends AuthRepository {
  APIRequesterHTTP apiRequesterHTTP = APIRequesterHTTP();

  @override
  Future<APIResult> login(
      RequestEntity<LoginRequestValue> requestEntity) async {
    String apiPath = APIConfig().host! + APIRoutes.login;
    APIResult<http.Response> response = await apiRequesterHTTP.post(
      headers: APIHeader.json,
      uri: apiPath,
      body: requestEntity.params,
    );

    return response;
  }

  @override
  Future<APIResult> validateToken(
      RequestEntity<ValidateTokenRequestValue> requestEntity) async {
    String apiPath = APIConfig().host! + APIRoutes.validateToken;
    APIResult<http.Response> response = await apiRequesterHTTP.post(
      headers: APIHeader.json,
      uri: apiPath,
      body: requestEntity.params,
    );

    return response;
  }
}
