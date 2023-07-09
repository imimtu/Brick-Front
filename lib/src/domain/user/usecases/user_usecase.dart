import 'dart:convert';

import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/response_entity.dart';
import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/user/entities/login/login_request_value.dart';
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

  // JoinEntityRes 정도가 좋을 듯 하다.
  Future<ResponseEntity<UserEntity>> join({
    required JoinRequestValue joinRequestValue,
  }) async {
    ResponseEntity<UserEntity> responseEntity;

    try {
      RequestEntity<JoinRequestValue> requestEntity =
          RequestEntity<JoinRequestValue>(
        value: joinRequestValue,
      );

      APIResult<http.Response> result = await remoteRepository
          .join(requestEntity) as APIResult<http.Response>;

      if (result.success) {
        var resJson = jsonDecode(result.response!.body);

        UserEntity userEntity = UserEntity.fromJson(resJson);

        responseEntity = ResponseEntity(isError: false, value: userEntity);
      } else {
        BrickError brickError = BrickError(
          errorMessage: result.error.toString(),
          errorParameters: joinRequestValue.toJson(),
        );

        responseEntity = ResponseEntity(isError: true, brickError: brickError);
      }
    } catch (error) {
      BrickError brickError = BrickError(
        errorMessage: error.toString(),
        errorParameters: joinRequestValue.toJson(),
      );

      responseEntity = ResponseEntity(isError: true, brickError: brickError);
    }

    return responseEntity;
  }

  Future<ResponseEntity<UserEntity>> login({
    required LoginRequestValue loginRequestValue,
  }) async {
    ResponseEntity<UserEntity> responseEntity;

    try {
      RequestEntity<LoginRequestValue> requestEntity =
          RequestEntity<LoginRequestValue>(
        value: loginRequestValue,
      );

      APIResult<http.Response> result = await remoteRepository
          .login(requestEntity) as APIResult<http.Response>;

      if (result.success) {
        var resJson = jsonDecode(result.response!.body);

        UserEntity userEntity = UserEntity.fromJson(resJson);

        responseEntity = ResponseEntity(isError: false, value: userEntity);
      } else {
        String errMsg = "";
        errMsg += result.error != null ? "[${result.error?.name}] " : '';
        errMsg += result.msg ?? "";

        BrickError brickError = BrickError(
          errorMessage: errMsg == '' ? "" : errMsg,
          errorParameters: loginRequestValue.toJson(),
        );

        responseEntity = ResponseEntity(isError: true, brickError: brickError);
      }
    } catch (error) {
      BrickError brickError = BrickError(
        errorMessage: error.toString(),
        errorParameters: loginRequestValue.toJson(),
      );

      responseEntity = ResponseEntity(isError: true, brickError: brickError);
    }

    return responseEntity;
  }
}
