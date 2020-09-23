part of core.blocs.user;

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;
  final AuthBloc authBloc;
  StreamSubscription _authBlocSubscription;

  UserBloc({
    this.userRepository,
    this.authBloc,
  }) : super(InitialState()) {
    _authBlocSubscription = authBloc.listen((state) {
      if (state is NotAuthenticated) {
        add(UserClearEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _authBlocSubscription.cancel();
    return super.close();
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    switch (event.runtimeType) {
      case LoadUserEvent:
        yield* _loadUser(event);
        break;
      case LoadedUserEvent:
        yield* _loadedUser(event);
        break;
      case UserClearEvent:
        yield UserUninitialized();
        break;
      case SignInEmailEvent:
        yield* _signInEmail(event);
        break;
      case UpdateUserLocationEvent:
        yield* _updateUserLocation(event);
        break;
      default:
    }
  }

  Stream<UserState> _loadUser(LoadUserEvent event) async* {
    try {
      final token = await userRepository.getAccessToken();
      if (token == null) {
        yield UserUninitialized();
      } else {
        final user = await userRepository.getCurrentUser();
        yield UserLoaded(user);
      }
    } catch (error) {
      yield UserError(NetworkUtils.parseError(error));
    }
  }

  Stream<UserState> _loadedUser(LoadedUserEvent event) async* {
    yield UserLoaded(event.user);
  }

  Stream<UserState> _signInEmail(SignInEmailEvent event) async* {
    try {
      yield UserLoading();
      final resp = await userRepository.login(event.user);
      authBloc.add(SignedInEvent(accessToken: resp.token));
      yield UserLoaded(resp.user);
    } catch (error) {
      yield UserError(NetworkUtils.parseError(error));
    }
  }

  Stream<UserState> _updateUserLocation(UpdateUserLocationEvent event) async* {
    try {
      yield UserLoading();
      final currentUser = (state as UserLoaded).user;
      currentUser.location = event.location;
      yield UserLoaded(currentUser);
    } catch (error) {
      yield UserError(NetworkUtils.parseError(error));
    }
  }
}
