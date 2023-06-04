part of brick.config.api;

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
