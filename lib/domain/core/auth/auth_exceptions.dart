class AuthException implements Exception {}

class InvalidEmailAndPasswordCombination extends AuthException {
  @override
  String toString() {
    return 'Invalid email and password combination';
  }
}

class EmailNotVerified extends AuthException {}

class EmailAlreadyExists extends AuthException {}
