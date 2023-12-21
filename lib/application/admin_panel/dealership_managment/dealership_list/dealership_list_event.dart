part of 'dealership_list_bloc.dart';

@immutable
abstract class DealershipListEvent {}

class DealershipListInitialized extends DealershipListEvent {}

class DealershipListSearchTermChanged extends DealershipListEvent {
  final String text;
  DealershipListSearchTermChanged({@required this.text});
}
