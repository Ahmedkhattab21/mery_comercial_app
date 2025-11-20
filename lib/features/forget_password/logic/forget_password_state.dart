
abstract class  ForgetPasswordState {}

class InitialState extends ForgetPasswordState {}


class OnForgetPasswordLoadingState extends ForgetPasswordState {}

class OnForgetPasswordSuccessState extends ForgetPasswordState {
  String message;

  OnForgetPasswordSuccessState({required this.message});
}

class OnForgetPasswordErrorState extends ForgetPasswordState {
  String message;

  OnForgetPasswordErrorState({required this.message});
}

class OnForgetPasswordCatchErrorState extends ForgetPasswordState {
  String message;

  OnForgetPasswordCatchErrorState({required this.message});
}
