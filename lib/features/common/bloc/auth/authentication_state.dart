part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  final AuthenticationStatus status;
  final UserModel user;
  const AuthenticationState._({required this.status, required this.user});
  const AuthenticationState.authenticated(UserModel user)
      : this._(
    status: AuthenticationStatus.authenticated,
    user: user,
  );
  AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated, user: UserModel());
  AuthenticationState.loading()
      : this._(status: AuthenticationStatus.loading, user: UserModel());
  AuthenticationState.cancelLoading()
      : this._(status: AuthenticationStatus.cancelLoading, user: UserModel());

  @override
  List<Object?> get props => [user];

  AuthenticationState copyWith({
    AuthenticationStatus? status,
    UserModel? user,
  }) =>
      AuthenticationState._(
          status: status ?? this.status, user: user ?? this.user);
}