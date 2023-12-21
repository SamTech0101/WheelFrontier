import 'package:abs_customer_sites/domain/admin-panel/requests/contact_us/contact_us.dart';

abstract class ContactUsAdminRepository {
  Future<List<ContactUsAdmin>> readAll();
  Future<ContactUsAdmin> read(String contactUsId);
  Future<void> update(ContactUsAdmin contactUs);
  Future<void> delete(ContactUsAdmin contactUs);
}
