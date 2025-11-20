
abstract class  ForgetPassword2State {}

class InitialState extends ForgetPassword2State {}


class OnForgetPasswordLoadingState extends ForgetPassword2State {}

class OnForgetPasswordSuccessState extends ForgetPassword2State {
  String message;

  OnForgetPasswordSuccessState({required this.message});
}

class OnForgetPasswordErrorState extends ForgetPassword2State {
  String message;

  OnForgetPasswordErrorState({required this.message});
}

class OnForgetPasswordCatchErrorState extends ForgetPassword2State {
  String message;

  OnForgetPasswordCatchErrorState({required this.message});
}
