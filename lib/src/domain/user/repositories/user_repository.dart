import 'package:brick/src/domain/user/entities/login/login_entity_req.dart';
import 'package:brick/src/domain/user/entities/join/join_entity_req.dart';
import 'package:brick/src/domain/user/models/user.dart';

abstract class UserRepository {
  /// 회원 가입
  Future join(JoinEntityReq user);

  /// 로그인
  Future login(LoginEntityReq user);

  /// User 정보 조회
  Future read(User user);

  /// User 정보 변경
  Future update(User user);

  /// 회원 탈퇴
  Future delete(User user);
}
