part of core.blocs.user;

@immutable
abstract class UserEvent extends Equatable {
  UserEvent([List props = const []]);
}

class LoadUserEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class LoadedUserEvent extends UserEvent {
  final User user;

  LoadedUserEvent(this.user);
  @override
  List<Object> get props => [user];
}

class UserClearEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class SignInEmailEvent extends UserEvent {
  final LoginUser user;

  SignInEmailEvent({
    @required this.user,
  });
  @override
  List<Object> get props => null;
}

class UpdateUserLocationEvent extends UserEvent {
  final Location location;

  UpdateUserLocationEvent(this.location);

  @override
  List<Object> get props => [location];
}
