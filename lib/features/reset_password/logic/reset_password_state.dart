
abstract class  ResetPasswordState {}

class InitialState extends ResetPasswordState {}


class OnResetPasswordLoadingState extends ResetPasswordState {}
class IsPasswordVisibleState extends ResetPasswordState {}

class OnResetPasswordSuccessState extends ResetPasswordState {
  String message;

  OnResetPasswordSuccessState({required this.message});
}

class OnResetPasswordErrorState extends ResetPasswordState {
  String message;

  OnResetPasswordErrorState({required this.message});
}

class OnResetPasswordCatchErrorState extends ResetPasswordState {
  String message;

  OnResetPasswordCatchErrorState({required this.message});
}
