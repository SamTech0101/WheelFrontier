import 'dart:async';
import 'package:flutter/material.dart';
import 'package:abs_customer_sites/domain/core/service/service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'add_service_from_event.dart';
part 'add_service_from_state.dart';

// using hydrated bloc for caching the state of form on every change
// so if user forgets to submit the form, it can continue sometime else

class AddServiceFromBloc
    extends HydratedBloc<AddServiceFromEvent, AddServiceFromState> {
  AddServiceFromBloc() : super(AddServiceState.initial());

  @override
  Stream<AddServiceFromState> mapEventToState(
    AddServiceFromEvent event,
  ) async* {
    AddServiceState currentState = state as AddServiceState;
    if (event is AddServiceTypeChanged) {
      Service service = currentState.service.copyWith(type: event.type);
      yield currentState.copyWith(service: service);
    } else if (event is AddServiceDescriptionChanged) {
      Service service =
          currentState.service.copyWith(description: event.description);
      yield currentState.copyWith(service: service);
    } else if (event is AddServiceNumberChanged) {
      Service service = currentState.service.copyWith(number: event.number);
      yield currentState.copyWith(service: service);
    } else if (event is AddServiceMinCountChanged) {
      Service service = currentState.service.copyWith(minCount: event.minCount);
      yield currentState.copyWith(service: service);
    } else if (event is AddServiceTermDayChanged) {
      Service service = currentState.service.copyWith(termsDay: event.termDay);
      yield currentState.copyWith(service: service);
    } else if (event is AddServiceIsDefaultChanged) {
      Service service =
          currentState.service.copyWith(isDefault: event.isDefault);
      yield currentState.copyWith(service: service);
    }
  }

  // toJson and fromJson method gets called on every new state
  // and the jsonified result will be saved in the HydratedStorage that
  // is initialized at the main method

  @override
  AddServiceFromState fromJson(Map<String, dynamic> json) {
    try {
      AddServiceState addServiceState = AddServiceState.fromMap(json);
      return addServiceState;
    } catch (_) {
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(AddServiceFromState state) {
    if (state is AddServiceState) {
      return state.toMap();
    } else {
      return null;
    }
  }
}
