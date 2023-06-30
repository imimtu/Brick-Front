import 'package:brick/src/domain/helpers/entitiy_helper/response_entity.dart';
import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';
import 'package:brick/src/domain/user/entities/join/join_request_value.dart';
import 'package:brick/src/domain/user/entities/login/login_request_value.dart';
import 'package:brick/src/domain/user/entities/user_entitiy.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/user/repository_implements/user_repository_local.dart';
import 'package:brick/src/domain/user/repository_implements/user_repository_remote.dart';
import 'package:brick/src/domain/user/usecases/user_usecase.dart';
import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  late UserUsecase usecase;

  bool isLogined = false;

  User? user;

  AuthProvider() {
    UserRepositoryRemote userRepositoryRemote = UserRepositoryRemote();
    UserRepositoryLocal userRepositoryLocal = UserRepositoryLocal();

    usecase = UserUsecase(
      remoteRepository: userRepositoryRemote,
      localRepository: userRepositoryLocal,
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
      ResponseEntity responseEntity = await usecase.login(
        loginRequestValue: loginRequestValue,
      );

      if (responseEntity.isError) {
        brickError = responseEntity.brickError;
      } else {
        UserEntity userEntity = responseEntity.value as UserEntity;

        isLogined = true;

        user = User(
          id: userEntity.userId ?? "",
          name: userEntity.username ?? "",
          nickName: userEntity.nickName ?? "",
          email: email,
          phoneNumber: userEntity.phoneNumber ?? "",
        );

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

  Future logout() async {
    isLogined = false;

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
      ResponseEntity<UserEntity> responseEntity = await usecase.join(
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
