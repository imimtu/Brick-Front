library brick.config.api;

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:brick/src/util/brick_logger.dart';
import 'package:http/http.dart' as http;
import 'package:just_util/just_util.dart';

part 'api_routes.dart';
part 'api_headers.dart';

class APIConfig {
  static final APIConfig _instance = APIConfig._();

  APIConfig._() {
    BrickLogger().info(
      msg: "[APIConfig] Created",
      block: "Singleton Constructor",
    );
  }

  factory APIConfig() {
    return _instance;
  }

  /// API 요청 Domain 경로
  String? host;

  /// API 요청처리 대기 시간
  /// - Default : 8초
  Duration timeLimit = const Duration(seconds: 8);

  /// API Timeout 시 실행될 함수
  FutureOr<http.Response> Function()? onTimeout;

  /// READ 요청에 대해 Timeout 시 실행될 함수
  FutureOr<String> Function()? onTimeoutAtRead;

  /// READ BYTES 요청에 대해 Timeout 시 실행될 함수
  FutureOr<Uint8List> Function()? onTimeoutAtReadBytes;

  // Initialize API Configs
  void init({
    String? host,
    Duration? timeout,
    FutureOr<http.Response> Function()? onTimeout,
    FutureOr<String> Function()? onTimeoutAtRead,
    FutureOr<Uint8List> Function()? onTimeoutAtReadAsBytes,
  }) {
    BrickLogger().info(msg: 'host : $host', block: 'API Config');

    _instance
      ..host = host ?? _instance.host
      ..timeLimit = timeout ?? _instance.timeLimit
      ..onTimeout = onTimeout ?? _instance.onTimeout
      ..onTimeoutAtRead = onTimeoutAtRead ?? _instance.onTimeoutAtRead
      ..onTimeoutAtReadBytes =
          onTimeoutAtReadAsBytes ?? _instance.onTimeoutAtReadBytes;
  }

  /// API 요청에 대한 로그 생성
  void _logRequest({
    required String method,
    required String uri,
  }) {
    String timeStamp = DateTime.now().toYYYYMMDDHHMMSS();

    String msg = '$timeStamp [$method] $uri';

    BrickLogger().msg(
      msg: msg,
      block: 'API REUQEST',
    );
  }

  /// Request with [http.get] Method
  Future<http.Response> sendGet({
    required String routes,
    Map<String, String>? headers,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'GET', uri: uri.toString());

    http.Response response = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.post] Method
  Future<http.Response> sendPost({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'POST', uri: uri.toString());

    http.Response response = await http
        .post(
          uri,
          headers: headers,
          body: body,
          encoding: encoding,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.put] Method
  Future<http.Response> sendPut({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'PUT', uri: uri.toString());

    http.Response response = await http
        .put(
          uri,
          headers: headers,
          body: body,
          encoding: encoding,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.delete] Method
  Future<http.Response> sendDelete({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'DELETE', uri: uri.toString());

    http.Response response = await http
        .delete(
          uri,
          headers: headers,
          body: body,
          encoding: encoding,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.patch] Method
  Future<http.Response> sendPatch({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'PATCH', uri: uri.toString());

    http.Response response = await http
        .patch(
          uri,
          headers: headers,
          body: body,
          encoding: encoding,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.read] Method
  Future<String> sendRead({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'READ', uri: uri.toString());

    String response = await http
        .read(
          uri,
          headers: headers,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeoutAtRead,
        );

    return response;
  }

  /// Request with [http.readAsBytes] Method
  Future<Uint8List> sendReadBytes({
    required String routes,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_instance.host! + routes);

    _logRequest(method: 'READ_BYTES', uri: uri.toString());

    Uint8List response = await http
        .readBytes(
          uri,
          headers: headers,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeoutAtReadBytes,
        );

    return response;
  }
}
