class PermissionException implements Exception {
  PermissionException(this.message);

  final String message;

  @override
  String toString() => 'PermissionException: message: $message';
}

class PermissionExceptionLocationDenied extends PermissionException {
  PermissionExceptionLocationDenied(super.message);

  @override
  String toString() => 'PermissionExceptionLocationDenied: message: $message';
}

class PermissionExceptionNotificationsDenied extends PermissionException {
  PermissionExceptionNotificationsDenied(super.message);

  @override
  String toString() =>
      'PermissionExceptionNotificationsDenied: message: $message';
}
