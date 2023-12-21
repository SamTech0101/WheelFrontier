// general exceptions that the application migh throw

class NoConnectionException implements Exception {
  @override
  String toString() {
    return 'You are not connected to internet';
  }
}

class NoInternetException implements Exception {
  @override
  String toString() {
    return 'You are not connected to internet';
  }
}

class ServerInternalException implements Exception {
  @override
  String toString() {
    return 'Server doesnt response. try again after a few moment.';
  }
}

class UnknownException implements Exception {
  @override
  String toString() {
    return 'Unknown error has occured,contact support for more information';
  }
}
