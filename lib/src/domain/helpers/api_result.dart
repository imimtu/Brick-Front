enum ApiErrors {
  unexpected,
  network,
  noResult,
  invalidInput,
}

/// Response Value Object
///
/// - value's type is [T]. and it is Server's response data type.
/// It could be [Map<String, dynamic>], [bool], ... .
///
/// - msg can be a success message or error message.
///
class ApiResult<T> {
  final bool success;
  final ApiErrors? error;
  final String? msg;
  final T? value;

  ApiResult(this.success, {this.error, this.msg, this.value});
}
