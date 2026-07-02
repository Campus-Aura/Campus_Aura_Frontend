/// Application-layer exceptions thrown by data-sources.
/// Repositories catch these and convert them to [Failure] objects.
sealed class AppException implements Exception {
  const AppException(this.message);
  final String message;
}

final class FirebaseAuthException extends AppException {
  const FirebaseAuthException(super.message);
}

final class FirestoreException extends AppException {
  const FirestoreException(super.message);
}

final class StorageException extends AppException {
  const StorageException(super.message);
}

final class NetworkException extends AppException {
  const NetworkException([super.message = 'No internet connection.']);
}

final class PermissionException extends AppException {
  const PermissionException([super.message = 'Permission denied.']);
}

final class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Resource not found.']);
}

final class UnexpectedException extends AppException {
  const UnexpectedException([super.message = 'Unexpected error.']);
}
