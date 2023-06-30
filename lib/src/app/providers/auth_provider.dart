import 'package:brick/src/domain/helpers/entitiy_helper/response_entity.dart';
import 'package:brick/src/domain/user/entities/join/join_entity_req.dart';
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

  Future login({
    required String email,
    required String userPassword,
  }) async {
    isLogined = true;

    notifyListeners();
  }

  Future logout() async {
    isLogined = false;

    notifyListeners();
  }

  Future<ResponseEntity<User>> join({
    required String email,
    required String userPassword,
  }) async {
    JoinRequestValue joinRequestValue =
        JoinRequestValue(email: email, userPassword: userPassword);

    ResponseEntity<UserEntity> responseEntity = await usecase.join(
      joinRequestValue: joinRequestValue,
    );

    UserEntity userEntity = responseEntity.value as UserEntity;

    User user = User(
      id: userEntity.userId ?? "",
      name: userEntity.username ?? "",
      nickName: userEntity.nickName ?? "",
      email: email,
      phoneNumber: userEntity.phoneNumber ?? "",
    );

    return ResponseEntity(
      isError: responseEntity.isError,
      brickError: responseEntity.brickError,
      value: user,
    );
  }
}
