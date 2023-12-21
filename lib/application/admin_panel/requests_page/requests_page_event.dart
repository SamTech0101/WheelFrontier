part of 'requests_page_bloc.dart';

@immutable
abstract class RequestsPageEvent {}

class RequestsPageInitialized extends RequestsPageEvent {}

class RequestsPageFilterChanged extends RequestsPageEvent {
  final String dateSort;
  final String requestType;
  final List<String> statusTypes;
  RequestsPageFilterChanged({
    @required this.dateSort,
    @required this.requestType,
    @required this.statusTypes,
  });
}

class SingUpRequestAcceptButtonPressed extends RequestsPageEvent {
  final SignUpRequest signUpRequest;
  SingUpRequestAcceptButtonPressed({@required this.signUpRequest});
}

class SingUpRequestRejectButonPressed extends RequestsPageEvent {
  final SignUpRequest signUpRequest;
  SingUpRequestRejectButonPressed({@required this.signUpRequest});
}
