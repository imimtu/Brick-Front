/// - 현재 빌드 타겟 모드
/// - **.env 결정을 위한 enum 값
enum EnvTarget {
  local,
  develop,
  release,
}

/// - .env에 정의된 키를 위한 enum
/// - 사용시 [toUpperCamelCase] 함수를 호출해 사용
enum EnvKey {
  apiUrl,
}

extension EnvKeyExtension on EnvKey {
  String toUpperCamelCase() {
    switch (this) {
      case EnvKey.apiUrl:
        return "API_URL";
      default:
        return name;
    }
  }
}
