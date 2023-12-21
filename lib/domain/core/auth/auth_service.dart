import 'package:abs_customer_sites/domain/core/user/user.dart';

abstract class AuthService {
  Future<String> signIn(String email, String password);
  Future<User> getUserInfo();
}
