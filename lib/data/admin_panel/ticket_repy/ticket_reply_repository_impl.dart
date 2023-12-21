import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply.dart';
import 'package:abs_customer_sites/domain/core/ticket_reply/ticket_reply_repository.dart';
import 'package:abs_customer_sites/domain/core/general_exception.dart';
import 'package:http_parser/http_parser.dart';
import 'package:http/http.dart' as http;

class TicketReplyRepositoryImpl extends TicketReplyRepository {
  TicketReplyRepositoryImpl();

  static const baseURl = '192.168.1.101:8000';
  static const path = '/reply';

  @override
  Future<List<TicketReply>> readRepliesOf(String ticketId) async {
    try {
      Uri uri = Uri.http(baseURl, '$path/1');
      var response = await http.get(uri);
      Map<String, dynamic> json = jsonDecode(response.body);
      List jsons = json['data'];
      List<TicketReply> replies = [];
      jsons.forEach((json) {
        TicketReply reply = TicketReply.fromMap(json);
        replies.add(reply);
      });
      return replies;
    } catch (e) {
      if (e is NoConnectionException || e is NoInternetException) {
        rethrow;
      }
    }
    return [];
  }

  @override
  Future<void> create(String ticketId, String text, List<File> files) async {
    try {
      Uri uri = Uri.http(baseURl, '$path');
      var req = http.MultipartRequest('POST', Uri.parse(uri.toString()));
      for (var i = 0; i < files.length; i++) {
        req.files.add(
          await http.MultipartFile.fromPath(
            'files',
            files[i].path,
          ),
        );
      }
      req.fields.addAll({
        'id': ticketId,
        'text': text,
      });
      var result = await req.send();
      if (result.statusCode != 200) {
        throw ReplyTicketException(message: 'Couldnt save your reply!');
      }
      print(result.statusCode);
    } catch (e) {
      if (e is NoConnectionException ||
          e is NoInternetException ||
          e is ReplyTicketException) {
        rethrow;
      } else {
        throw UnknownException();
      }
    }
  }

  @override
  Future<TicketReply> read(String ticketId) {
    // TODO: implement read
    throw UnimplementedError();
  }
}
