import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/user/models/user.dart';

abstract class UserRepository {
  /// 회원 가입
  Future<APIResult> join(RequestEntity<JoinRequestValue> requestEntity);

  /// User 정보 조회
  Future read(User user);

  /// User 정보 변경
  Future update(User user);

  /// 회원 탈퇴
  Future delete(User user);
}
