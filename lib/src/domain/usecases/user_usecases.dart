import 'package:brick/src/domain/models/models.dart';
import 'package:brick/src/domain/repositories/user_repository.dart';

class UserUsecases {
  final UserRepository _remoteRepository;
  final UserRepository _localRepository;

  UserUsecases({
    required UserRepository remoteRepository,
    required UserRepository localRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository;

  Future<Result<User>> getUserInfo() async {
    try {
      // TODO: 사용자 정보 가져오는 로직 생성

      return Result(true);
    } catch (e) {
      return Result(false, error: Errors.unexpected, msg: e.toString());
    }
  }
}
