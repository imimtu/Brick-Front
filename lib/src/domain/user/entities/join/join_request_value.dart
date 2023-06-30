import 'package:brick/src/domain/helpers/entitiy_helper/interfaces/request_value_interface.dart';
import 'package:just_util/just_util.dart';

class JoinRequestValue extends RequestValueInterface {
  String userId;
  String userPassword;

  JoinRequestValue({
    required this.userId,
    required this.userPassword,
  });

  @override
  JustJson toJson() {
    JustJson json = {};

    json.setIfPresent(key: "userId", val: userId);
    json.setIfPresent(key: "userPassword", val: userPassword);

    return json;
  }
}
