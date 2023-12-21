part of 'lead_bloc.dart';

@immutable
abstract class LeadEvent {}

class LeadPageInitialized extends LeadEvent {}

class LeadPageUpdate extends LeadEvent {
  final dynamic request;
  LeadPageUpdate({@required this.request});
}

class LeadPageFilter extends LeadEvent {
  final List apiTypeFilter;
  final List statusFilter;
  final DateTime dateFilter;
  final String nameFilter;

  LeadPageFilter({
    this.apiTypeFilter,
    this.statusFilter,
    this.dateFilter,
    this.nameFilter,
  });
}


