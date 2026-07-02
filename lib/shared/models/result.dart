/// Generic result wrapper for use-case return values.
/// Replaces throwing exceptions in the domain layer.
sealed class Result<T> {
  const Result();
}

final class Success<T> extends Result<T> {
  const Success(this.data);
  final T data;
}

final class Failure<T> extends Result<T> {
  const Failure(this.failure);
  final AppFailure failure;
}

// ── Convenience typedef ───────────────────────────────────────────────────

typedef AsyncResult<T> = Future<Result<T>>;
