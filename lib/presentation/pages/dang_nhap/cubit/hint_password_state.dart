part of 'hint_password_cubit.dart';


class HintPasswordState extends Equatable {
  final bool isHintPassword;

  HintPasswordState copyWith({
    final bool? isHintPassword,
  }) {
    return HintPasswordState(
      isHintPassword: isHintPassword ?? this.isHintPassword,
    );
  }

  const HintPasswordState({required this.isHintPassword});

  @override
  List<Object?> get props => [isHintPassword];
}
