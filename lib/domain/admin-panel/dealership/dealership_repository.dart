import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';

abstract class DealershipRepository {
  Future<List<Dealership>> getAllDealershipNames();
}
