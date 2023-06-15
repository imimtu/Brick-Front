import 'package:brick/src/domain/helpers/entitiy_helper/entity_interface_request.dart';
import 'package:just_util/just_util.dart';

class LoginEntityReq extends EntityInterfaceRequest {
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
