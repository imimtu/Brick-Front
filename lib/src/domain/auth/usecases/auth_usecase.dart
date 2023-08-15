import 'dart:convert';

import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/auth/entities/token/token_entity.dart';
import 'package:brick/src/domain/auth/entities/token/valid_token_request_value.dart';
import 'package:brick/src/domain/auth/repositories/auth_repository.dart';
import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/request_entity.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/response_entity.dart';
import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';
import 'package:http/http.dart' as http;

class AuthUsecase {
  final AuthRepository remoteRepository;
  final AuthRepository localReposiotry;

  const AuthUsecase({
    required this.remoteRepository,
    required this.localReposiotry,
  });

  Future<ResponseEntity<TokenEntity>> login({
    required LoginRequestValue loginRequestValue,
  }) async {
    ResponseEntity<TokenEntity> responseEntity;

    try {
      RequestEntity<LoginRequestValue> requestEntity =
          RequestEntity<LoginRequestValue>(
        value: loginRequestValue,
      );

      APIResult<http.Response> result = await remoteRepository
          .login(requestEntity) as APIResult<http.Response>;

      if (result.success) {
        var resJson = jsonDecode(result.response!.body);

        TokenEntity tokenEntity = TokenEntity.fromJson(resJson['result']);

        responseEntity = ResponseEntity(isError: false, value: tokenEntity);
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

  Future<ResponseEntity<bool>> validateToken({
    required ValidateTokenRequestValue validateTokenRequestValue,
  }) async {
    ResponseEntity<bool> responseEntity;

    try {
      RequestEntity<ValidateTokenRequestValue> requestEntity =
          RequestEntity<ValidateTokenRequestValue>(
        value: validateTokenRequestValue,
      );

      APIResult<http.Response> result = await remoteRepository
          .validateToken(requestEntity) as APIResult<http.Response>;

      if (result.success) {
        var resJson = jsonDecode(result.response!.body);

        bool tokenEntity = resJson['result'];

        responseEntity = ResponseEntity(isError: false, value: tokenEntity);
      } else {
        String errMsg = "";
        errMsg += result.error != null ? "[${result.error?.name}] " : '';
        errMsg += result.msg ?? "";

        BrickError brickError = BrickError(
          errorMessage: errMsg == '' ? "" : errMsg,
          errorParameters: validateTokenRequestValue.toJson(),
        );

        responseEntity = ResponseEntity(isError: true, brickError: brickError);
      }
    } catch (error) {
      BrickError brickError = BrickError(
        errorMessage: error.toString(),
        errorParameters: validateTokenRequestValue.toJson(),
      );

      responseEntity = ResponseEntity(isError: true, brickError: brickError);
    }

    return responseEntity;
  }
}
