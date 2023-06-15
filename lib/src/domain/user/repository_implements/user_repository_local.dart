import 'package:brick/src/domain/user/entities/login/login_entity_req.dart';
import 'package:brick/src/domain/user/entities/join/join_entity_req.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';

class UserRepositoryLocal implements UserRepository {
  @override
  Future join(JoinEntityReq user) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future login(LoginEntityReq user) {
    // TODO: implement read
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
