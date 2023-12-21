import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abs_customer_sites/application/core/enums.dart';
import 'package:abs_customer_sites/domain/admin-panel/requests/contact_us/contact_us_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/requests/demo_request/demo_request_repository.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request.dart';
import 'package:abs_customer_sites/domain/admin-panel/sign_up_request/sign_up_request_repository.dart';
import 'package:meta/meta.dart';

part 'requests_page_event.dart';
part 'requests_page_state.dart';

// getting requests sent from dealership to admin

class RequestsPageBloc extends Bloc<RequestsPageEvent, RequestsPageState> {
  final ContactUsAdminRepository contactUsRepository;
  final DemoRequestRepository demoRequestRepository;
  final SingUpRequestRepository singUpRequestRepository;
  RequestsPageBloc({
    this.contactUsRepository,
    this.demoRequestRepository,
    this.singUpRequestRepository,
  }) : super(RequestsPageInitial());

  @override
  Stream<RequestsPageState> mapEventToState(
    RequestsPageEvent event,
  ) async* {
    if (event is RequestsPageInitialized) {
      try {
        yield RequestsPageLoading();
        List<SignUpRequest> signUpRequests =
            await singUpRequestRepository.readAll();
        yield RequestsPageSuccess(
          dateSort: Date_Descending,
          requests: signUpRequests,
          filteredStatuses: [Seen_Status, UnSeen_Status, Responded_Status],
        );
      } catch (e) {
        yield RequestsPageFailure(exception: e);
      }
    } else if (event is SingUpRequestAcceptButtonPressed) {
      // number two meants admin accepted dealership request
      await singUpRequestRepository.update(
        event.signUpRequest,
        '2',
      );
    } else if (event is SingUpRequestRejectButonPressed) {
      // number three meants admin rejected dealership request
      await singUpRequestRepository.update(
        event.signUpRequest,
        '3',
      );
    } else if (event is RequestsPageFilterChanged) {}
  }
}
