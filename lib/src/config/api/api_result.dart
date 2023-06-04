part of brick.config.api;

/// Response Value Object
///
/// - Value's type is [T] and it is response data type.
///     - If use [http](https://pub.dev/packages/http) package, [T] will be http.Response
///
/// - msg can be a success message or error message.
///
class APIResult<T> {
  final bool success;
  final APIErrors? error;
  final String? msg;
  final T? response;

  APIResult(
    this.success, {
    this.error,
    this.msg,
    this.response,
  });
}
