import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';

abstract class TicketRepository {
  Future<List<Ticket>> readAll();
  Future<Ticket> read(String ticketId);
  Future<void> create(Ticket ticket);
  Future<void> updateStatus(String ticketId, int status);
}
