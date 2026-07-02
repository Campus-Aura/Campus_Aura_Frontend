/// Domain-layer failure types.
/// Returned by use-cases so the presentation layer never touches exceptions.
sealed class Failure {
  const Failure(this.message);
  final String message;
}

/// Firebase Auth / Firestore / Storage failures.
final class FirebaseFailure extends Failure {
  const FirebaseFailure(super.message);
}

/// Network / connectivity failures.
final class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'No internet connection.']);
}

/// Input validation failures (client-side).
final class ValidationFailure extends Failure {
  const ValidationFailure(super.message);
}

/// Permission denied (Firestore security rules / role guard).
final class PermissionFailure extends Failure {
  const PermissionFailure([super.message = 'You do not have permission to perform this action.']);
}

/// Resource not found in Firestore.
final class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Resource not found.']);
}

/// Catch-all for unexpected failures.
final class UnexpectedFailure extends Failure {
  const UnexpectedFailure([super.message = 'An unexpected error occurred.']);
}
