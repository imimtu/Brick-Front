import 'package:brick/src/domain/helpers/mixins/error_mixin.dart';

/// Entity Interface for response from server or DB.
abstract class EntityInterfaceResponse with ErrorMixin {
  // Most cases, should implement fromJson constructor with factory keyword.
}
