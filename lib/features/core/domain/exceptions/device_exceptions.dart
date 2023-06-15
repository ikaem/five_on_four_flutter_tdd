class DeviceException implements Exception {
  DeviceException(this.message);

  final String message;

  @override
  String toString() => 'DeviceException: message: $message';
}

class DeviceExceptionLocationServiceDisabled extends DeviceException {
  DeviceExceptionLocationServiceDisabled(super.message);

  @override
  String toString() =>
      'DeviceExceptionLocationServiceDisabled: message: $message';
}
