import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply.dart';

abstract class TicketReplyRepository {
  Future<List<TicketReply>> readRepliesOf(String ticketId);
  Future<TicketReply> read(String ticketId);
  Future<void> create(String ticketId, String text, List<File> files);
}

class ReplyTicketException implements Exception {
  final String message;
  ReplyTicketException({@required this.message});
}
