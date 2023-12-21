import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:abs_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/book_appointment/book_appointment_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/car_finder/car_finder.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/car_finder/car_finder_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/contact_us/contact_us.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/contact_us/contact_us_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/order_part/order_part.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/order_part/order_part_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/service_appointment/service_appointment_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/test_drive/test_drive_repository.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/value_trade/value_trade.dart';
import 'package:hillz_customer_sites/domain/dealership-panel/lead/value_trade/value_trade_repository.dart';
import 'package:meta/meta.dart';
part 'lead_event.dart';
part 'lead_state.dart';

class LeadBloc extends Bloc<LeadEvent, LeadState> {
  final ContactUsDealershipRepository contactUsRepository;
  final ValueTradeRepository valueTradeRepository;
  final OrderPartRepository orderPartRepository;
  final TestDriveRepository testDriveRepository;
  final ServiceAppointmentRepository serviceAppointmentRepository;
  final CarFinderRepository carFinderRepository;
  final BookAppointmentRepository bookAppointmentRepository;
  List leads = [];

  LeadBloc({
    @required this.contactUsRepository,
    @required this.valueTradeRepository,
    @required this.orderPartRepository,
    @required this.testDriveRepository,
    @required this.serviceAppointmentRepository,
    @required this.carFinderRepository,
    @required this.bookAppointmentRepository,
  }) : super(LeadInitial());
  /*Todo: Impliment testDrive inside lead center */
  @override
  Stream<LeadState> mapEventToState(
    LeadEvent event,
  ) async* {
    if (event is LeadPageInitialized) {
      /* this event define for init state when all leads fetch from server */
      try {
        List<ContactUsDealership> contacUsList =
            await contactUsRepository.fetchContactUs(10, 10);
        List<ValueTrade> valueList =
            await valueTradeRepository.fetchValueTrades(10, 10);
        List<CarFinder> carFinderList =
            await carFinderRepository.fetchCarFinders(10, 10);
        List<OrderPart> orderPartList =
            await orderPartRepository.fetchOrderParts(10, 10);
        List<ServiceAppointment> serviceAppointmentList =
            await serviceAppointmentRepository.fetchServiceAppointments(10, 10);
        List<BookAppointment> bookAppointmentList =
            await bookAppointmentRepository.fetchBookAppointment(10, 10);
        /*add each lead based on alphabet order*/
        leads = [
          ...bookAppointmentList,
          ...carFinderList,
          ...contacUsList,
          ...orderPartList,
          ...serviceAppointmentList,
          ...valueList,
        ];
        /*sort lead list based on api type , date and status */
        leads.sort((a, b) => a.apiType.compareTo(b.apiType));
        leads.sort((a, b) => b.date.compareTo(a.date));
        leads.sort((a, b) => a.status.compareTo(b.status));

        yield LeadSuccess(leads: leads);
      } catch (e) {
        print(e);
      }
    } else if (event is LeadPageUpdate) {
      /* this event define for updating lead status*/
      if (event.request is ContactUsDealership) {
        await contactUsRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      } else if (event.request is ValueTrade) {
        await valueTradeRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      } else if (event.request is CarFinder) {
        await carFinderRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      } else if (event.request is OrderPart) {
        await orderPartRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      } else if (event.request is ServiceAppointment) {
        await serviceAppointmentRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      } else if (event.request is BookAppointment) {
        await bookAppointmentRepository.update(event.request);
        yield LeadSuccess(leads: leads);
      }
    } else if (event is LeadPageFilter) {
      /* this event define for filtering lead list based on name , date , api type and status*/
      List filteredLeadList = leads;
      if (event.apiTypeFilter.isNotEmpty) {
        filteredLeadList = filteredLeadList.where((lead) {
          return event.apiTypeFilter.contains(lead.apiType);
        }).toList();
      }
      if (event.statusFilter.isNotEmpty) {
        filteredLeadList = filteredLeadList.where((lead) {
          return event.statusFilter.contains(lead.status);
        }).toList();
      }

      if (event.nameFilter.isNotEmpty || event.nameFilter != null) {
        filteredLeadList = filteredLeadList.where((lead) {
          String fullName =
              '${lead.user.fName.toLowerCase()}${lead.user.lName.toLowerCase()}';
          return fullName.contains(event.nameFilter.toLowerCase());
        }).toList();
      }
      if (event.dateFilter != null) {
        filteredLeadList = filteredLeadList.where((lead) {
          return event.dateFilter.day == lead.date.day &&
              event.dateFilter.year == lead.date.year &&
              event.dateFilter.month == lead.date.month;
        }).toList();
      }

      yield LeadSuccess(leads: filteredLeadList);
    }
  }
}
