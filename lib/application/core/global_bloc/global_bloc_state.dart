part of 'global_bloc_bloc.dart';

@immutable
abstract class GlobalBlocState {}

class GlobalAppState extends GlobalBlocState {
  final DateTime authTokenDate;
  final User user;

  GlobalAppState({
    this.authTokenDate,
    this.user,
  });

  AuthState get authState {
    if (authTokenDate != null) {
      DateTime now = DateTime.now();
      if (now.difference(authTokenDate).inHours < 5) {
        return AuthState.authenticated;
      } else {
        return AuthState.unAuthenticated;
      }
    } else {
      return AuthState.guest;
    }
  }

  factory GlobalAppState.initial() => GlobalAppState();

  GlobalAppState copyWith({
    DateTime authTokenDate,
    User user,
  }) {
    return GlobalAppState(
      authTokenDate: authTokenDate ?? this.authTokenDate,
      user: user ?? this.user,
    );
  }

  @override
  String toString() =>
      'GlobalAppState(authTokenDate: $authTokenDate, user: $user)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GlobalAppState &&
        other.authTokenDate == authTokenDate &&
        other.user == user;
  }

  @override
  int get hashCode => authTokenDate.hashCode ^ user.hashCode;
}

enum AuthState { guest, authenticated, unAuthenticated }
