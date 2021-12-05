class APIResponse<T> {
  T data;
  bool error;
  String errorMessage;
  int statusCode;
  String errorType;

  APIResponse(
      {this.data,
      this.error = false,
      this.errorMessage,
      this.statusCode,
      this.errorType});
}
