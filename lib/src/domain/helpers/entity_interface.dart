/// Entity Interface to communicate with server.
abstract class EntityInterface {
  /// check response is error;
  set isError(bool value);

  bool get isError;

  Map<String, dynamic> toJson();

  // Most cases, should implement fromJson constructor with factory keyword.
}
