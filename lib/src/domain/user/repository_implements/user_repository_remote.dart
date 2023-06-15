import 'package:brick/src/domain/user/entities/signIn/sign_in_entity_req.dart';
import 'package:brick/src/domain/user/entities/signUp/sign_up_entity_req.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';

class UserRepositoryRemote implements UserRepository {
  @override
  Future signUp(SignUpEntityReq user) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future signIn(SigninEntityReq user) {
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
