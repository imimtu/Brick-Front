/// Entity Interface to communicate with server.
abstract class EntityInterface {
  bool isError;

  EntityInterface({
    this.isError = false,
  });

  Map<String, dynamic> toJson();

  // Most cases, should implement fromJson constructor with factory keyword.
}
