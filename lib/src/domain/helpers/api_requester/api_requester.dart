library brick.domain.helpers.api_requester;

part 'models/api_result.dart';
part 'models/api_headers.dart';
part 'models/api_errors.dart';

abstract class APIRequester {
  /// API Request - Method 'GET'
  Future<APIResult> get({required String uri});

  /// API Request - Method 'POST'
  Future<APIResult> post({required String uri});

  /// API Request - Method 'PUT'
  Future<APIResult> put({required String uri});

  /// API Request - Method 'DELETE'
  Future<APIResult> delete({required String uri});
}
