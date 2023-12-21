part of 'dealership_list_bloc.dart';

@immutable
abstract class DealershipListState {}

class DealershipListInitial extends DealershipListState {}

class DealershipListSuccess extends DealershipListState {
  final KtList<Dealership> dealerships;
  DealershipListSuccess({@required this.dealerships});

  @override
  String toString() => 'DealershipListSuccess(dealerships: $dealerships)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DealershipListSuccess && other.dealerships == dealerships;
  }

  @override
  int get hashCode => dealerships.hashCode;
}

class DealershipListFailure extends DealershipListState {
  final Exception exception;
  DealershipListFailure({@required this.exception});
}

class DealershipListLoading extends DealershipListState {}
