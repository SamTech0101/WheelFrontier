part of 'ticket_reply_bloc.dart';

@immutable
abstract class TicketReplyEvent {}

class TicketReplyTextChanged extends TicketReplyEvent {
  final String text;
  TicketReplyTextChanged({
    @required this.text,
  });
}

class TicketReplyAddFileButtonPressed extends TicketReplyEvent {}

class TicketReplyFileDeleted extends TicketReplyEvent {
  final PlatformFile platformFile;
  TicketReplyFileDeleted({
    @required this.platformFile,
  });
}

class TicketReplySendButtonPressed extends TicketReplyEvent {}
