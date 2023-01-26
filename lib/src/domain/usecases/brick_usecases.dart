import 'package:brick/src/domain/models/models.dart';
import 'package:brick/src/domain/repositories/brick_repository.dart';

class BrickUsecases {
  final BrickRepository _remoteRepository;
  final BrickRepository _localRepository;

  BrickUsecases({
    required BrickRepository remoteRepository,
    required BrickRepository localRepository,
  })  : _remoteRepository = remoteRepository,
        _localRepository = localRepository;

  Future<Result<List<Brick>>> allBricks(User user) async {
    try {
      // TODO(kangmin): 모든 Brick 데이터 가져오는 로직 생성

      return Result(true);
    } catch (e) {
      return Result(false, error: Errors.unexpected, msg: e.toString());
    }
  }
}
