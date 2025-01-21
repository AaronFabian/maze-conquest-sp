class HandledError implements Exception {
  final String message;
  HandledError(this.message);

  @override
  String toString() => "⚠️ $message";
}
