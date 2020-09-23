part of core.blocs.auth;

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepository userRepository;

  AuthBloc({
    @required this.userRepository,
  }) : super(AuthInitialState());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    switch (event.runtimeType) {
      case SignedInEvent:
        yield* _signIn(event);
        break;
      case SignOutEvent:
        yield* _signOut(event);
        break;
      default:
    }
  }

  Stream<AuthState> _signIn(SignedInEvent event) async* {
    try {
      await userRepository.setAccessToken(event.accessToken);
      yield Authenticated();
    } catch (error) {
      yield AuthError(error.toString());
    }
  }

  Stream<AuthState> _signOut(SignOutEvent event) async* {
    await userRepository.removeAccessToken();
    yield NotAuthenticated();
    if (event.onComplete != null) {
      event.onComplete();
    }
  }
}
