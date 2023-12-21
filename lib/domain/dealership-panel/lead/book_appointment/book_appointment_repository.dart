import 'book_appointment.dart';

abstract class BookAppointmentRepository {
  Future<List<BookAppointment>> fetchBookAppointment(int limit, int offset);
  Future<void> update(BookAppointment bookAppointment);
}
