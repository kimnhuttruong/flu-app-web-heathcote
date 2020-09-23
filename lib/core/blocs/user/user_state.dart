part of core.blocs.user;

@immutable
abstract class UserState extends Equatable {
  UserState([List props = const []]);
}

class InitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserUninitialized extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoading extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);

  @override
  List<Object> get props => [user];
}

class UserError extends UserState {
  final String message;

  UserError(this.message);

  @override
  List<Object> get props => [message];
}
