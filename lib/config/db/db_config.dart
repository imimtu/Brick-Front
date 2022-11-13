// TODO(Kangmin): SQLite 설정관련 클래스 생성

class DBConfig {
  DBConfig._();

  static final DBConfig _instance = DBConfig._();

  factory DBConfig() {
    return _instance;
  }

  Future init() async {}
}
