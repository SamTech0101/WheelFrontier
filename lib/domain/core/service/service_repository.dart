import 'dart:developer';

abstract class ServiceRepository {
  Future<List<Service>> readAll();
  Future<Service> read(String serviceId);
  Future<void> create(Service serive);
  Future<void> update(Service service);
  Future<void> delete(Service service);
}
