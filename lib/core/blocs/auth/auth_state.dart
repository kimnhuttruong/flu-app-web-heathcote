part of core.blocs.auth;

@immutable
abstract class AuthState extends Equatable {
  AuthState([List props = const []]);
}

class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class NotAuthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String message;

  AuthError(this.message);

  @override
  List<Object> get props => [message];
}
