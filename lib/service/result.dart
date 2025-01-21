class Result<T> {
  final Exception? error;
  final T? value;
  Result({this.value, this.error});
}
