import 'dart:async';
import 'dart:convert';

import 'package:brick/src/domain/helpers/api_requester/api_requester.dart';
import 'package:brick/src/util/brick_logger.dart';
import 'package:http/http.dart' as http;
import 'package:just_util/just_util.dart';

class APIRequesterHTTP extends APIRequester {
  /// API 요청처리 대기 시간
  /// - Default : 8초
  final Duration timeLimit;

  /// API Timeout 시 실행될 함수
  FutureOr<http.Response> Function()? onTimeout;

  APIRequesterHTTP({
    this.timeLimit = const Duration(seconds: 8),
    this.onTimeout,
  });

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

  APIResult<http.Response> _checkResponse({
    required http.Response response,
  }) {
    APIResult<http.Response> apiResult;

    if (response.body.isEmpty) {
      APIErrors apiErrors = APIErrors.noResult;
      apiResult = APIResult(false, error: apiErrors, response: response);
    } else {
      Map<String, dynamic> body = jsonDecode(response.body);

      if (body.containsKey('resultCode') && body['resultCode'] == 'SUCCESS') {
        apiResult = APIResult(true, response: response);
      } else {
        apiResult = APIResult(
          false,
          msg: "[${body['resultCode']}] ${body['result'] ?? ''}",
          response: response,
        );
      }
    }

    return apiResult;
  }

  @override
  Future<APIResult<http.Response>> get({
    required String uri,
    Map<String, String>? headers,
  }) async {
    APIResult<http.Response> apiResult;

    _logRequest(method: "GET", uri: uri);

    Uri targetUri = Uri.parse(uri);

    http.Client client = http.Client();

    try {
      http.Response response = await client
          .get(
            targetUri,
            headers: headers,
          )
          .timeout(
            timeLimit,
            onTimeout: onTimeout,
          );

      apiResult = _checkResponse(response: response);

      client.close();
    } catch (e) {
      apiResult = APIResult(
        false,
        msg: e.toString(),
      );
    }

    return apiResult;
  }

  @override
  Future<APIResult<http.Response>> post({
    required String uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    APIResult<http.Response> apiResult;

    _logRequest(method: "POST", uri: uri);

    Uri targetUri = Uri.parse(uri);

    http.Client client = http.Client();

    try {
      http.Response response = await client
          .post(
            targetUri,
            headers: headers,
            body: body,
            encoding: encoding,
          )
          .timeout(
            timeLimit,
            onTimeout: onTimeout,
          );

      apiResult = _checkResponse(response: response);

      client.close();
    } catch (e) {
      apiResult = APIResult(
        false,
        msg: e.toString(),
      );
    }

    return apiResult;
  }

  @override
  Future<APIResult<http.Response>> put({
    required String uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    APIResult<http.Response> apiResult;

    _logRequest(method: "PUT", uri: uri);

    Uri targetUri = Uri.parse(uri);

    http.Client client = http.Client();

    try {
      http.Response response = await client
          .put(
            targetUri,
            headers: headers,
            body: body,
            encoding: encoding,
          )
          .timeout(
            timeLimit,
            onTimeout: onTimeout,
          );

      apiResult = _checkResponse(response: response);

      client.close();
    } catch (e) {
      apiResult = APIResult(
        false,
        msg: e.toString(),
      );
    }

    return apiResult;
  }

  @override
  Future<APIResult<http.Response>> delete({
    required String uri,
    Map<String, String>? headers,
    Object? body,
    Encoding? encoding,
  }) async {
    APIResult<http.Response> apiResult;

    _logRequest(method: "DELETE", uri: uri);

    Uri targetUri = Uri.parse(uri);

    http.Client client = http.Client();

    try {
      http.Response response = await client
          .delete(
            targetUri,
            headers: headers,
            body: body,
            encoding: encoding,
          )
          .timeout(
            timeLimit,
            onTimeout: onTimeout,
          );

      apiResult = _checkResponse(response: response);

      client.close();
    } catch (e) {
      apiResult = APIResult(
        false,
        msg: e.toString(),
      );
    }

    return apiResult;
  }
}
