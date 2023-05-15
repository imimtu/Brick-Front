enum ApiErrors {
  unexpected,
  network,
  noResult,
  invalidInput,
}

class ApiResult<T> {
  final bool success;
  final ApiErrors? error;
  final String? msg;
  final T? value;

  ApiResult(this.success, {this.error, this.msg, this.value});
}
