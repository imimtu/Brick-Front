// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import './api_enums.dart';
import 'package:http/http.dart' as http;

class APIConfig {
  APIConfig._();

  static final APIConfig _instance = APIConfig._();

  APIHost? host;
  Duration timeLimit = const Duration(seconds: 8);
  FutureOr<http.Response> Function()? onTimeout;
  FutureOr<String> Function()? onTimeoutAtRead;
  FutureOr<Uint8List> Function()? onTimeoutAtReadBytes;

  // [todo] : API URL 생성 완료 시 주소 확정 시키기
  final Map<APIHost, String> _hostMap = {
    APIHost.beta: "http://",
    APIHost.release: "https://",
    APIHost.kangmin: "http://192.168.0.4",
  };

  /// Routes String
  final Map<APIRoutes, String> _routesMap = {
    APIRoutes.login: "/login",
    APIRoutes.todolist: "/todolist",
  };

  final Map<APIHeader, Map<String, String>> _headerMap = {
    APIHeader.cors: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Request-Headers": "*",
      "Access-Control-Resqust-Method": "*",
    },
    APIHeader.chrome: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Request-Headers": "*",
      "Access-Control-Resqust-Method": "DELETE,GET,OPTIONS,PATCH,POST,PUT",
      "content-type": "application/json",
    },
    APIHeader.json: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Request-Headers": "*",
      "Access-Control-Resqust-Method": "*",
      "content-type": "application/json",
    },
    APIHeader.image: {
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Request-Headers": "*",
      "Access-Control-Resqust-Method": "*",
      "content-type": "image/jpeg",
    },
  };

  factory APIConfig() {
    return _instance;
  }

  // Initialize API Configs
  void init({
    APIHost? host,
    Duration? timeout,
    FutureOr<http.Response> Function()? onTimeout,
    FutureOr<String> Function()? onTimeoutAtRead,
    FutureOr<Uint8List> Function()? onTimeoutAtReadAsBytes,
  }) {
    _instance
      ..host = host ?? _instance.host
      ..timeLimit = timeout ?? _instance.timeLimit
      ..onTimeout = onTimeout ?? _instance.onTimeout
      ..onTimeoutAtRead = onTimeoutAtRead ?? _instance.onTimeoutAtRead
      ..onTimeoutAtReadBytes =
          onTimeoutAtReadAsBytes ?? _instance.onTimeoutAtReadBytes;
  }

  /// Request with [http.get] Method
  Future<http.Response> sendGet({
    required APIRoutes routes,
    APIHeader? headers,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    http.Response response = await http
        .get(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeout,
        );

    return response;
  }

  /// Request with [http.post] Method
  Future<http.Response> sendPost({
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    http.Response response = await http
        .post(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
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
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    http.Response response = await http
        .put(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
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
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    http.Response response = await http
        .delete(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
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
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    http.Response response = await http
        .patch(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
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
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    String response = await http
        .read(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeoutAtRead,
        );

    return response;
  }

  /// Request with [http.readAsBytes] Method
  Future<Uint8List> sendReadBytes({
    required APIRoutes routes,
    APIHeader? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    Uri uri = Uri.parse(_hostMap[_instance.host!]! + _routesMap[routes]!);

    Uint8List response = await http
        .readBytes(
          uri,
          headers: headers != null ? _headerMap[headers] : null,
        )
        .timeout(
          _instance.timeLimit,
          onTimeout: _instance.onTimeoutAtReadBytes,
        );

    return response;
  }
}
