import 'dart:convert';

import 'package:brick/src/domain/helpers/entitiy_helper/interfaces/request_value_interface.dart';

class RequestEntity<T extends RequestValueInterface> {
  T value;

  String get params => jsonEncode(value.toJson());

  RequestEntity({
    required this.value,
  });
}
