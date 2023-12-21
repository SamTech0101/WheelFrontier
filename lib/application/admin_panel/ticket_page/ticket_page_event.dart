part of 'ticket_page_bloc.dart';

@immutable
abstract class TicketPageEvent {}

class TicketPageInitialized extends TicketPageEvent {}

class TicketPageFilterChanged extends TicketPageEvent {
  final String dateSort;
  final List<String> units;
  final List<String> statuses;
  TicketPageFilterChanged({
    @required this.dateSort,
    @required this.units,
    @required this.statuses,
  });
}
