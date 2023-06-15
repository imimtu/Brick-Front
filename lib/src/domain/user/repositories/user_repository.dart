import 'package:brick/src/domain/user/entities/signIn/sign_in_entity_req.dart';
import 'package:brick/src/domain/user/entities/signUp/sign_up_entity_req.dart';
import 'package:brick/src/domain/user/models/user.dart';

abstract class UserRepository {
  Future signUp(SignUpEntityReq user);

  Future signIn(SigninEntityReq user);

  Future read(User user);

  Future update(User user);

  Future delete(User user);
}
