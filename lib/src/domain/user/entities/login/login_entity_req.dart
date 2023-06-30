import 'package:brick/src/domain/helpers/entitiy_helper/interfaces/request_value_interface.dart';
import 'package:just_util/just_util.dart';

class LoginEntityReq extends RequestValueInterface {
  String email;
  String userPassword;

  LoginEntityReq({
    required this.email,
    required this.userPassword,
  });

  @override
  JustJson toJson() {
    JustJson json = {};

    json.setIfPresent(key: "email", val: email);
    json.setIfPresent(key: "userPassword", val: userPassword);

    return json;
  }
}
