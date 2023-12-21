import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';

abstract class SingUpRequestRepository {
  Future<List<SignUpRequest>> readAll();
  Future<SignUpRequest> read(String requestId);
  Future<void> update(SignUpRequest signUpRequest, String status);
}
