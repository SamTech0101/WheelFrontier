import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'add_ticket_form_event.dart';
part 'add_ticket_form_state.dart';

class AddTicketFormBloc extends Bloc<AddTicketFormEvent, AddTicketFormState> {
  AddTicketFormBloc() : super(AddTicketFormInitial());

  @override
  Stream<AddTicketFormState> mapEventToState(
    AddTicketFormEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
