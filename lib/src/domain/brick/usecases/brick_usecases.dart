import 'package:brick/src/domain/brick/models/brick.dart';
import 'package:brick/src/domain/helpers/api_result.dart';
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

  Future<ApiResult<List<Brick>>> allBricks(User user) async {
    try {
      // TODO(kangmin): 모든 Brick 데이터 가져오는 로직 생성

      return ApiResult(true);
    } catch (e) {
      return ApiResult(false, error: ApiErrors.unexpected, msg: e.toString());
    }
  }
}
