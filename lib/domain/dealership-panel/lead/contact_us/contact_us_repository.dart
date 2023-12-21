import 'contact_us.dart';

abstract class ContactUsDealershipRepository {
  Future<List<ContactUsDealership>> fetchContactUs(int limit, int offset);
  Future<void> update(ContactUsDealership contactUs);
}
