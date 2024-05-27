/// Represents a value that can be either of type [E] or of type [R].
/// Usually [E] is assumed to be of [Left] type and [R] of [Right] type, e.g.:
///
sealed class Folder<E, R> {
  const Folder._();

  B fold<B>(B Function(E error) onLeft, B Function(R result) onRight);

  bool get isLeft => this is Left<E, R>;

  bool get isRight => this is Right<E, R>;
}

final class Right<L, R> extends Folder<L, R> {
  Right(this._right) : super._();

  final R _right;

  @override
  B fold<B>(B Function(L value) onLeft, B Function(R value) onRight) => onRight(_right);
}

final class Left<L, R> extends Folder<L, R> {
  Left(this._left) : super._();

  final L _left;

  @override
  B fold<B>(B Function(L value) onLeft, B Function(R value) onRight) => onLeft(_left);
}
