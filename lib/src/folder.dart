/// Represents a value that can be either of type [L] or of type [R].
/// Usually [L] is assumed to be of [Left] type and [R] of [Right] type, e.g.:
///
sealed class Folder<L, R> {
  const Folder._();

  Future<B> fold<B>(B Function(L value) onLeft, B Function(R value) onRight);

  bool get isLeft => this is Left<L, R>;

  bool get isRight => this is Right<L, R>;
}

final class Right<L, R> extends Folder<L, R> {
  Right(this._right) : super._();

  final R _right;

  @override
  Future<B> fold<B>(B Function(L value) onLeft, B Function(R value) onRight) async => onRight(_right);
}

final class Left<L, R> extends Folder<L, R> {
  Left(this._left) : super._();

  final L _left;

  @override
  Future<B> fold<B>(B Function(L value) onLeft, B Function(R value) onRight) async => onLeft(_left);
}
