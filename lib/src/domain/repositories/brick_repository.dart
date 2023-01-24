import '../entities/entities.dart';

abstract class BrickRepository {
  Future create(Brick brick);

  Future read(Brick brick);

  Future update(Brick brick);

  Future delete(Brick brick);
}
