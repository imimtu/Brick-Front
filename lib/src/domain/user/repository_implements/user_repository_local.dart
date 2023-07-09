import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';

class UserRepositoryLocal implements UserRepository {
  @override
  Future<APIResult> join(
    RequestEntity<JoinRequestValue> requestEntity,
  ) {
    // TODO: implement create
    throw UnimplementedError();
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
