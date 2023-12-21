import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:abs_customer_sites/domain/core/user/user.dart';
import 'package:meta/meta.dart';

part 'global_bloc_event.dart';
part 'global_bloc_state.dart';

// global bloc is for handling the state the is needed all over the app
// like uer model an auth state

class GlobalBloc extends Bloc<GlobalBlocEvent, GlobalBlocState> {
  final Dio dio;
  GlobalBloc({@required this.dio}) : super(GlobalAppState.initial());

  @override
  Stream<GlobalBlocState> mapEventToState(
    GlobalBlocEvent event,
  ) async* {
    final currentState = state as GlobalAppState;
    if (event is AuthTokenChanged) {
      // updating the authorization header when the auth state changes
      dio.options.headers.addAll(
        {'Authorization': 'Bearer ${event.authToken}'},
      );
      // and the time that the header is added for checking if header has
      // expirred or not
      yield currentState.copyWith(authTokenDate: DateTime.now());
    } else if (event is AuthTokenExpired) {
      dio.options.headers.remove('Authorization');
    } else if (event is UserUpdated) {
      currentState.copyWith(user: event.user);
    }
  }
}
