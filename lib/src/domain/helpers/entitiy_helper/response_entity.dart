import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';

class ResponseEntity<T> {
  bool isError;

  // Most cases, should implement fromJson constructor with factory keyword.
  BrickError? brickError;

  T? value;

  ResponseEntity({
    required this.isError,
    this.brickError,
    this.value,
  });
}
