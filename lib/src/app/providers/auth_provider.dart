import 'package:brick/src/domain/auth/entities/token/token_entity.dart';
import 'package:brick/src/domain/auth/entities/token/valid_token_request_value.dart';
import 'package:brick/src/domain/auth/repository_implements/auth_repository_local.dart';
import 'package:brick/src/domain/auth/repository_implements/auth_repository_remote.dart';
import 'package:brick/src/domain/auth/usecases/auth_usecase.dart';
import 'package:brick/src/domain/helpers/entitiy_helper/response_entity.dart';
import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/auth/entities/login/login_request_value.dart';
import 'package:brick/src/domain/user/entities/user_entitiy.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repository_implements/user_repository_local.dart';
import 'package:brick/src/domain/user/repository_implements/user_repository_remote.dart';
import 'package:brick/src/domain/user/usecases/user_usecase.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  late UserUsecase userUsecase;
  late AuthUsecase authUsecase;

  bool isLogined = false;

  User? user;
  TokenEntity tokenEntity = TokenEntity();

  AuthProvider() {
    UserRepositoryRemote userRepositoryRemote = UserRepositoryRemote();
    UserRepositoryLocal userRepositoryLocal = UserRepositoryLocal();

    userUsecase = UserUsecase(
      remoteRepository: userRepositoryRemote,
      localRepository: userRepositoryLocal,
    );

    AuthRepositoryRemote authRepositoryRemote = AuthRepositoryRemote();
    AuthRepositoryLocal authRepositoryLocal = AuthRepositoryLocal();
    authUsecase = AuthUsecase(
      remoteRepository: authRepositoryRemote,
      localReposiotry: authRepositoryLocal,
    );
  }

  Future<BrickError?> login({
    required String email,
    required String userPassword,
  }) async {
    LoginRequestValue loginRequestValue = LoginRequestValue(
      userId: email,
      userPassword: userPassword,
    );

    BrickError? brickError;

    try {
      ResponseEntity<TokenEntity> responseEntity = await authUsecase.login(
        loginRequestValue: loginRequestValue,
      );

      if (responseEntity.isError) {
        brickError = responseEntity.brickError;
      } else {
        isLogined = true;
        tokenEntity = responseEntity.value as TokenEntity;

        notifyListeners();
      }
    } catch (error) {
      brickError = BrickError(
        errorMessage: error.toString(),
        errorParameters: loginRequestValue.toJson(),
      );
    }

    return brickError;
  }

  Future<BrickError?> validateToken() async {
    BrickError? brickError;

    if (tokenEntity.token != null) {
      ValidateTokenRequestValue validateTokenRequestValue =
          ValidateTokenRequestValue(token: tokenEntity.token!);

      ResponseEntity<bool> responseEntity = await authUsecase.validateToken(
          validateTokenRequestValue: validateTokenRequestValue);

      if (responseEntity.value != null) {
        isLogined = responseEntity.value!;
      }

      notifyListeners();
    }

    return brickError;
  }

  Future logout() async {
    isLogined = false;
    tokenEntity = TokenEntity();

    notifyListeners();
  }

  Future<BrickError?> join({
    required String email,
    required String userPassword,
  }) async {
    JoinRequestValue joinRequestValue =
        JoinRequestValue(userId: email, userPassword: userPassword);

    BrickError? brickError;

    try {
      ResponseEntity<UserEntity> responseEntity = await userUsecase.join(
        joinRequestValue: joinRequestValue,
      );

      if (responseEntity.isError) {
        brickError = responseEntity.brickError;
      }
    } catch (error) {
      brickError = BrickError(
        errorMessage: error.toString(),
        errorParameters: joinRequestValue.toJson(),
      );
    }

    return brickError;
  }
}
