class DBConfig {
  DBConfig._();

  static final DBConfig _instance = DBConfig._();

  factory DBConfig() {
    return _instance;
  }

  Future init() async {}
}
