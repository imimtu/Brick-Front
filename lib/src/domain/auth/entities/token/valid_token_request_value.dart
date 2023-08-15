import 'package:brick/src/domain/helpers/entitiy_helper/interfaces/request_value_interface.dart';
import 'package:just_util/just_util.dart';

class ValidateTokenRequestValue extends RequestValueInterface {
  String token;

  ValidateTokenRequestValue({
    required this.token,
  });

  @override
  JustJson toJson() {
    JustJson json = {};

    json.setIfPresent(key: "token", val: token);

    return json;
  }
}
