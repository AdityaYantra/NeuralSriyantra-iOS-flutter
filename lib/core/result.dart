class Result<T> {
  final T? data;
  final Object? error;

  Result._(this.data, this.error);

  bool get isSuccess => error == null;

  static Result<T> success<T>(T data) => Result._(data, null);
  static Result<T> failure<T>(Object error) => Result._(null, error);
}
