/// Represents a value that can be either of type [E] or of type [R].
/// Usually [E] is assumed to be of [Error] type and [R] of [Result] type, e.g.:
///
sealed class Folder<E, R> {
  const Folder._();

  B fold<B>(B Function(E error) onError, B Function(R result) onResult);

  bool get hasError => this is Error<E, R>;

  bool get hasResult => this is Result<E, R>;
}

final class Result<E, R> extends Folder<E, R> {
  Result(this._result) : super._();

  final R _result;

  @override
  B fold<B>(B Function(E error) onError, B Function(R result) onResult) => onResult(_result);
}

final class Error<E, R> extends Folder<E, R> {
  Error(this._error) : super._();

  final E _error;

  @override
  B fold<B>(B Function(E error) onError, B Function(R result) onResult) => onError(_error);
}
