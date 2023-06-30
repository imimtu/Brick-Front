import 'package:brick/src/domain/helpers/entitiy_helper/interfaces/request_value_interface.dart';

class RequestEntity<T extends RequestValueInterface> {
  T value;

  Map<String, dynamic> get params => value.toJson();

  RequestEntity({
    required this.value,
  });
}
