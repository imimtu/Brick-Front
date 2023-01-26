import '../models/models.dart';

abstract class UserRepository {
  Future create(User user);

  Future read(User user);

  Future update(User user);

  Future delete(User user);
}
