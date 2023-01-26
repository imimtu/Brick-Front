enum Errors {
  unexpected,
  network,
  noResult,
  invalidInput,
}

class Result<T> {
  final bool success;
  final Errors? error;
  final String? msg;
  final T? value;

  Result(this.success, {this.error, this.msg, this.value});
}
