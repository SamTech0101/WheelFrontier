part of 'global_bloc_bloc.dart';

@immutable
abstract class GlobalBlocEvent {}

class AuthTokenChanged extends GlobalBlocEvent {
  final String authToken;
  AuthTokenChanged({@required this.authToken});
}

class AuthTokenExpired extends GlobalBlocEvent {}

class UserUpdated extends GlobalBlocEvent {
  final User user;
  UserUpdated({@required this.user});
}
