import 'package:brick/src/domain/brick/models/brick.dart';
import 'package:brick/src/config/api/api_config.dart';
import 'package:brick/src/domain/user/models/user.dart';
import 'package:brick/src/domain/brick/repositories/brick_repository.dart';

class BrickUsecases {
  final BrickRepository _remoteRepository;
  final BrickRepository _localRepository;

  BrickUsecases({
    required BrickRepository remoteRepository,
    required BrickRepository localRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository;

  Future<APIResult<List<Brick>>> allBricks(User user) async {
    try {
      // TODO(kangmin): 모든 Brick 데이터 가져오는 로직 생성

      return APIResult(true);
    } catch (e) {
      return APIResult(false, error: APIErrors.unexpected, msg: e.toString());
    }
  }
}
