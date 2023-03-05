import 'package:just_util/just_log.dart';

class BrickLogger {
  static final BrickLogger _instance = BrickLogger._internal();

  BrickLogger._internal() {
    info(msg: 'Class Created', block: 'BrickLogger');
  }

  factory BrickLogger() {
    return _instance;
  }

  void error({
    required String msg,
    String block = "BrickLogger",
    bool useDevLog = true,
  }) {
    final JustLogConfig errorConfig = JustLogConfig(
      fontColor: LogFontColor.brightRed,
      block: block,
    );

    if (useDevLog) {
      JustLog.logCallStack(msg, config: errorConfig);
    } else {
      JustLog.writeCallStack(msg, config: errorConfig);
    }
  }

  void debug({
    required String msg,
    String block = "BrickLogger",
    bool useDevLog = true,
  }) {
    final JustLogConfig debugConfig = JustLogConfig(
      fontColor: LogFontColor.brightYellow,
      block: block,
    );

    if (useDevLog) {
      JustLog.logCallStack(msg, config: debugConfig);
    } else {
      JustLog.writeCallStack(msg, config: debugConfig);
    }
  }

  void info({
    required String msg,
    String block = "BrickLogger",
    bool useDevLog = true,
  }) {
    final JustLogConfig infoConfig = JustLogConfig(
      fontColor: LogFontColor.brightGreen,
      block: block,
    );

    if (useDevLog) {
      JustLog.log(msg, config: infoConfig);
    } else {
      JustLog.write(msg, config: infoConfig);
    }
  }

  void msg({
    required String msg,
    String block = "BrickLogger",
    bool useDevLog = true,
  }) {
    final JustLogConfig msgConfig = JustLogConfig(
      fontColor: LogFontColor.brightBlue,
      block: block,
    );

    JustLog.log(msg, config: msgConfig);
  }

  void write({
    required String msg,
    JustLogConfig? justLogConfig,
    bool useDevLog = true,
  }) {
    if (useDevLog) {
      JustLog.log(msg, config: justLogConfig);
    } else {
      JustLog.write(msg, config: justLogConfig);
    }
  }

  void writeCallStack({
    required String msg,
    JustLogConfig? justLogConfig,
    bool useDevLog = true,
  }) {
    if (useDevLog) {
      JustLog.logCallStack(msg, config: justLogConfig);
    } else {
      JustLog.writeCallStack(msg, config: justLogConfig);
    }
  }
}
