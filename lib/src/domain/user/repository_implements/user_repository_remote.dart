import 'package:brick/src/config/api/api_config.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/api_requester/implements/api_requester_http.dart';
import 'package:brick/src/domain/user/entities/login/login_entity_req.dart';
import 'package:brick/src/domain/user/entities/join/join_entity_req.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';
import 'package:http/http.dart';

class UserRepositoryRemote implements UserRepository {
  APIRequesterHTTP apiRequesterHTTP = APIRequesterHTTP();
  @override
  Future<APIResult<Response>> join(JoinEntityReq joinEntityReq) async {
    String apiPath = APIConfig().host! + APIRoutes.join;
    APIResult<Response> response = await apiRequesterHTTP.post(
      uri: apiPath,
      body: joinEntityReq.toJson(),
    );

    return response;
  }

  @override
  Future<APIResult<Response>> login(LoginEntityReq loginEntityReq) async {
    String apiPath = APIConfig().host! + APIRoutes.login;
    APIResult<Response> response = await apiRequesterHTTP.post(
      uri: apiPath,
      body: loginEntityReq.toJson(),
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
