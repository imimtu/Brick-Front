import 'dart:convert';

import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/user/entities/join/join_entity_req.dart';
import 'package:brick/src/domain/user/entities/user_entitiy.dart';
import 'package:brick/src/domain/user/repositories/user_repository.dart';
import 'package:http/http.dart' as http;

class UserUsecase {
  final UserRepository remoteRepository;
  final UserRepository localRepository;

  const UserUsecase({
    required this.remoteRepository,
    required this.localRepository,
  });

  // TODO: UserEntity를 바로 넘기는 것이 아닌, 에러 여부와 에러 내용까지 모두 포함 할 수 있는 Value Object가 필요.
  // JoinEntityRes 정도가 좋을 듯 하다.
  Future<UserEntity> join({
    required String email,
    required String userPassword,
  }) async {
    JoinEntityReq joinEntityReq = JoinEntityReq(
      email: email,
      userPassword: userPassword,
    );

    APIResult<http.Response> result =
        await remoteRepository.join(joinEntityReq);

    var resJson = jsonDecode(result.response!.body);

    UserEntity userEntity = UserEntity.fromJson(resJson);

    return userEntity;
  }
}
