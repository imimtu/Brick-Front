import 'package:brick/src/domain/brick/models/brick.dart';

abstract class BrickRepository {
  Future create(Brick brick);

  Future read(Brick brick);

  Future update(Brick brick);

  Future delete(Brick brick);
}
