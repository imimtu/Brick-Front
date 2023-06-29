import 'package:brick/src/domain/helpers/error_helper/brick_error.dart';

/// Entity Interface for response from server or DB.
abstract class EntityInterfaceResponse {
  // Most cases, should implement fromJson constructor with factory keyword.
  BrickError brickError;

  EntityInterfaceResponse({
    required this.brickError,
  });
}
