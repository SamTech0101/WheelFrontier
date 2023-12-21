import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket.dart';
import 'package:abs_customer_sites/domain/core/ticket/ticket_repository.dart';
import 'package:meta/meta.dart';

part 'ticket_page_event.dart';
part 'ticket_page_state.dart';

// getting tickets from api and showing snackbar failure when something goes
// wrong

class TicketPageBloc extends Bloc<TicketPageEvent, TicketPageState> {
  final TicketRepository ticketRepository;
  TicketPageBloc({@required this.ticketRepository})
      : super(TicketPageInitial());

  @override
  Stream<TicketPageState> mapEventToState(
    TicketPageEvent event,
  ) async* {
    if (event is TicketPageInitialized) {
      yield TicketPageLoading();
      List<Ticket> tickets;
      try {
        tickets = await ticketRepository.readAll();
        yield TicketPageSuccess(
          dateSort: 'asd',
          units: units,
          statuses: [],
          tickets: tickets,
        );
      } catch (e) {
        yield TicketPageFailure();
        Get.snackbar(
          'Something went wrong',
          e.toString(),
          backgroundColor: Colors.blue[50],
        );
      }
    } else if (event is TicketPageFilterChanged) {}
  }
}

List<String> units = [Sales_Unit, Support_Unit, Admin_Unit];

const Sales_Unit = 'Sales';
const Support_Unit = 'Support';
const Admin_Unit = 'Admin';
