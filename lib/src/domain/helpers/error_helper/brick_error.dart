class BrickError {
  String errorMessage;
  Error? errorData;
  Map<String, dynamic>? errorParameters;

  BrickError({
    this.errorMessage = '',
    this.errorData,
    this.errorParameters,
  });
}
