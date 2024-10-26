part of 'authen_cubit.dart';

class AuthenState extends Equatable {
  final bool isAuth;
  const AuthenState({
    required this.isAuth,
  });

  @override
  List<Object?> get props => [isAuth];

  AuthenState copyWith({
    bool? isAuth,
  }) {
    return AuthenState(
      isAuth: isAuth ?? this.isAuth,
    );
  }
}