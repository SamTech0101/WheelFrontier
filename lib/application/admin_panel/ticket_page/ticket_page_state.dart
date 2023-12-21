part of 'ticket_page_bloc.dart';

@immutable
abstract class TicketPageState {}

class TicketPageInitial extends TicketPageState {}

class TicketPageLoading extends TicketPageState {}

class TicketPageSuccess extends TicketPageState {
  final String dateSort;
  final List<String> units;
  final List<String> statuses;
  final List<Ticket> tickets;
  TicketPageSuccess({
    @required this.dateSort,
    @required this.units,
    @required this.statuses,
    @required this.tickets,
  });

  TicketPageSuccess copyWith({
    String dateSort,
    List<String> units,
    List<String> statuses,
    List<Ticket> tickets,
  }) {
    return TicketPageSuccess(
      dateSort: dateSort ?? this.dateSort,
      units: units ?? this.units,
      statuses: statuses ?? this.statuses,
      tickets: tickets ?? this.tickets,
    );
  }
}

class TicketPageFailure extends TicketPageState {}
