import 'package:abs_customer_sites/domain/admin-panel/requests/demo_request/demo_request.dart';

abstract class DemoRequestRepository {
  Future<List<DemoRequest>> readAll();
  Future<DemoRequest> read(String demoRequestId);
  Future<void> update(DemoRequest demoRequest);
  Future<void> delete(DemoRequest demoRequest);
}
