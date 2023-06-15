import 'package:brick/src/domain/helpers/mixins/json_mixin.dart';
import 'package:just_util/just_util.dart';

class UserEntity with JsonMixin {
  int? id;
  String? userId;
  String userPassword;
  String? nickName;
  String email;
  String? phoneNumber;
  String? role;
  DateTime? createdAt;
  String? createdBy;
  DateTime? modifiedAt;
  String? modifiedBy;
  bool? active;
  bool? enabled;
  List<JustJson>? authorities;
  String? password;
  bool? accountNonExpired;
  bool? credentialsNonExpired;
  bool? accountNonLocked;
  String? username;

  UserEntity({
    this.id,
    this.userId,
    required this.userPassword,
    this.nickName,
    required this.email,
    this.phoneNumber,
    this.role,
    this.createdAt,
    this.createdBy,
    this.modifiedAt,
    this.modifiedBy,
    this.active,
    this.enabled,
    this.authorities,
    this.password,
    this.accountNonExpired,
    this.credentialsNonExpired,
    this.accountNonLocked,
    this.username,
  });

  @override
  JustJson toJson() {
    JustJson json = {};

    json.setIfPresent(key: "id", val: id);
    json.setIfPresent(key: "userId", val: userId);
    json.setIfPresent(key: "userPassword", val: userPassword);
    json.setIfPresent(key: "nickName", val: nickName);
    json.setIfPresent(key: "email", val: email);
    json.setIfPresent(key: "phoneNumber", val: phoneNumber);
    json.setIfPresent(key: "role", val: role);
    json.setIfPresent(key: "createdAt", val: createdAt?.toString());
    json.setIfPresent(key: "createdBy", val: createdBy);
    json.setIfPresent(key: "modifiedAt", val: modifiedAt?.toString());
    json.setIfPresent(key: "modifiedBy", val: modifiedBy);
    json.setIfPresent(key: "active", val: active);
    json.setIfPresent(key: "enabled", val: enabled);
    json.setIfPresent(key: "authorities", val: authorities);
    json.setIfPresent(key: "password", val: password);
    json.setIfPresent(key: "accountNonExpired", val: accountNonExpired);
    json.setIfPresent(key: "credentialsNonExpired", val: credentialsNonExpired);
    json.setIfPresent(key: "accountNonLocked", val: accountNonLocked);
    json.setIfPresent(key: "username", val: username);

    return json;
  }

  factory UserEntity.fromJson(JustJson json) {
    int? id = json.getIfPresent(
      key: "id",
    );

    String? userId = json.getIfPresent(
      key: "userId",
    );

    String userPassword = json.getIfPresent(
      key: "userPassword,",
      defaultVal: "",
    );

    String? nickName = json.getIfPresent(
      key: "nickName",
    );

    String email = json.getIfPresent(
      key: "email,",
      defaultVal: "",
    );

    String? phoneNumber = json.getIfPresent(
      key: "phoneNumber",
    );

    String? role = json.getIfPresent(
      key: "role",
    );

    DateTime? createdAt = json.getIfPresent(
      key: "createdAt",
    );

    String? createdBy = json.getIfPresent(
      key: "createdBy",
    );

    DateTime? modifiedAt = json.getIfPresent(
      key: "modifiedAt",
    );

    String? modifiedBy = json.getIfPresent(
      key: "modifiedBy",
    );

    bool? active = json.getIfPresent(
      key: "active",
    );

    bool? enabled = json.getIfPresent(
      key: "enabled",
    );

    List<JustJson>? authorities = json.getIfPresent(
      key: "authorities",
    );

    String? password = json.getIfPresent(
      key: "password",
    );

    bool? accountNonExpired = json.getIfPresent(
      key: "accountNonExpired",
    );

    bool? credentialsNonExpired = json.getIfPresent(
      key: "credentialsNonExpired",
    );

    bool? accountNonLocked = json.getIfPresent(
      key: "accountNonLocked",
    );

    String? username = json.getIfPresent(
      key: "username",
    );

    return UserEntity(
      id: id,
      userId: userId,
      userPassword: userPassword,
      nickName: nickName,
      email: email,
      phoneNumber: phoneNumber,
      role: role,
      createdAt: createdAt,
      createdBy: createdBy,
      modifiedAt: modifiedAt,
      modifiedBy: modifiedBy,
      active: active,
      enabled: enabled,
      authorities: authorities,
      password: password,
      accountNonExpired: accountNonExpired,
      credentialsNonExpired: credentialsNonExpired,
      accountNonLocked: accountNonLocked,
      username: username,
    );
  }
}
