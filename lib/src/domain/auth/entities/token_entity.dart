import 'package:brick/src/domain/helpers/mixins/json_mixin.dart';
import 'package:just_util/just_util.dart';

class TokenEntity with JsonMixin {
  String? token;
  String? refreshToken;

  TokenEntity({
    this.token,
    this.refreshToken,
  });

  @override
  JustJson toJson() {
    JustJson json = {};

    json.setIfPresent(key: 'token', val: token);
    json.setIfPresent(key: 'refreshToken', val: refreshToken);

    return json;
  }

  factory TokenEntity.fromJson(JustJson json) {
    String? token = json.getIfPresent(key: 'token');
    String? refreshToken = json.getIfPresent(key: 'refreshToken');

    return TokenEntity(
      token: token,
      refreshToken: refreshToken,
    );
  }
}
