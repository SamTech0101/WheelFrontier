import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket_repository.dart';
import 'package:http/http.dart' as http;

class TicketRepositoryImpl extends TicketRepository {
  static const baseURl = '192.168.1.101:8000';
  static const path = '/ticket/desc';

  @override
  Future<List<Ticket>> readAll() async {
    try {
      Uri uri = Uri.http(baseURl, path);
      var response = await http.get(uri);
      Map<String, dynamic> json = jsonDecode(response.body);
      List jsons = json['data'];
      List<Ticket> tickets = [];
      jsons.forEach(
        (json) {
          Ticket ticket = Ticket.fromMap(json);
          tickets.add(ticket);
        },
      );
      return tickets;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> create(Ticket serive) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<Ticket> read(String serviceId) {
    // TODO: implement read
    throw UnimplementedError();
  }

  @override
  Future<void> updateStatus(String ticketId, int status) async {
    try {
      Uri uri = Uri.http(baseURl, '$path/1');
      var response = await http.put(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'status': status}),
      );
    } catch (e) {
      rethrow;
    }
  }
}
