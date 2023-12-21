import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership.dart';
import 'package:abs_customer_sites/domain/admin-panel/dealership/dealership_repository.dart';
import 'package:kt_dart/kt.dart';

import 'package:meta/meta.dart';

part 'dealership_list_event.dart';
part 'dealership_list_state.dart';

class DealershipListBloc
    extends Bloc<DealershipListEvent, DealershipListState> {
  final DealershipRepository dealershipRepository;
  DealershipListBloc({@required this.dealershipRepository})
      : super(DealershipListInitial());

  KtList<Dealership> dealerships;

  @override
  Stream<DealershipListState> mapEventToState(
    DealershipListEvent event,
  ) async* {
    if (event is DealershipListInitialized) {
      try {
        yield DealershipListLoading();
        List<Dealership> list =
            await dealershipRepository.getAllDealershipNames();
        dealerships = list.toImmutableList();
        yield DealershipListSuccess(dealerships: dealerships);
      } catch (e) {
        yield DealershipListFailure(exception: e);
      }
    }
    if (event is DealershipListSearchTermChanged) {
      // filtering dealerships by the name that admin enterd in the saerch box
      // it will work as an autocomplete feature

      KtList<Dealership> filteredDealerships = dealerships.filter(
        (dealership) => dealership.bussinessName
            .trim()
            .toLowerCase()
            .startsWith(event.text),
      );
      yield DealershipListSuccess(dealerships: filteredDealerships);
    }
  }
}
