part of 'requests_page_bloc.dart';

@immutable
abstract class RequestsPageState {}

class RequestsPageInitial extends RequestsPageState {}

class RequestsPageLoading extends RequestsPageState {}

class RequestsPageSuccess extends RequestsPageState {
  final List<dynamic> requests;
  final String dateSort;
  final List<String> filteredStatuses;

  RequestsPageSuccess({
    @required this.requests,
    @required this.dateSort,
    @required this.filteredStatuses,
  });

  RequestsPageSuccess copyWith({
    String dateSort,
    List<String> filteredStatuses,
    List<dynamic> requests,
  }) {
    return RequestsPageSuccess(
      dateSort: dateSort ?? this.dateSort,
      filteredStatuses: filteredStatuses ?? this.filteredStatuses,
      requests: requests ?? this.requests,
    );
  }
}

class RequestsPageFailure extends RequestsPageState {
  final Exception exception;
  RequestsPageFailure({@required this.exception});
}
