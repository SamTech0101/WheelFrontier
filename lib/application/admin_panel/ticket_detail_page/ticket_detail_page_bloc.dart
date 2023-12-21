import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket_repository.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply_repository.dart';
import 'package:meta/meta.dart';

part 'ticket_detail_page_event.dart';
part 'ticket_detail_page_state.dart';

class TicketDetailPageBloc
    extends Bloc<TicketDetailPageEvent, TicketDetailPageState> {
  final TicketReplyRepository ticketReplyRepository;
  final TicketRepository ticketRepository;
  final Ticket ticket;

  TicketDetailPageBloc({
    @required this.ticket,
    @required this.ticketReplyRepository,
    @required this.ticketRepository,
  }) : super(TicketDetailPageInitial());

  @override
  Stream<TicketDetailPageState> mapEventToState(
    TicketDetailPageEvent event,
  ) async* {
    if (event is TicketDetailInit) {
      yield TickeDetailPageLoading();
      // here number two meants status is seen
      await ticketRepository.updateStatus(ticket.id, 2);
      List<TicketReply> replies =
          await ticketReplyRepository.readRepliesOf(ticket.id);
      yield TicketDetailPageSuccess(replies: replies);
    }
  }
}
