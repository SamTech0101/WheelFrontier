import 'service_appointment.dart';

abstract class ServiceAppointmentRepository {
  Future<List<ServiceAppointment>> fetchServiceAppointments(
      int limit, int offset);
  Future<void> update(ServiceAppointment serviceAppointment);
}
