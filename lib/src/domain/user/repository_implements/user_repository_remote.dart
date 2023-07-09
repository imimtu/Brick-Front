import 'package:brick/src/config/api/api_config.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/api_requester/implements/api_requester_http.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:brick/src/domain/user/entities/login/login_request_value.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class UserRepositoryRemote implements UserRepository {
  APIRequesterHTTP apiRequesterHTTP = APIRequesterHTTP();

  @override
  Future<APIResult<http.Response>> join(
    RequestEntity<JoinRequestValue> requestEntity,
  ) async {
    String apiPath = APIConfig().host! + APIRoutes.join;
    APIResult<http.Response> response = await apiRequesterHTTP.post(
      headers: APIHeader.json,
      uri: apiPath,
      body: requestEntity.params,
    );

    return response;
  }

  @override
  Future<APIResult<http.Response>> login(
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
  Future read(User user) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future update(User user) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future delete(User user) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
