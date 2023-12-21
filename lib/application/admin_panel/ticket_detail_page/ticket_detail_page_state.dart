part of 'ticket_detail_page_bloc.dart';

@immutable
abstract class TicketDetailPageState {}

class TicketDetailPageInitial extends TicketDetailPageState {}

class TicketDetailPageSuccess extends TicketDetailPageState {
  final List<TicketReply> replies;
  TicketDetailPageSuccess({
    @required this.replies,
  });
}

class TickeDetailPageLoading extends TicketDetailPageState {}
