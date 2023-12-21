import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_request.dart';
import 'package:abs_customer_sites/domain/admin-panel/web_description/web_description_response.dart';

abstract class WebDescriptionRepository {
  Future<WebDescriptionResponse> read(String dealershipId);
  Future<void> create(WebDescriptionRequest webDescription);
  Future<void> update(
      String webDescriptionId, WebDescriptionRequest webDescription);
}

class NoWebDescrpitionFound implements Exception {}
