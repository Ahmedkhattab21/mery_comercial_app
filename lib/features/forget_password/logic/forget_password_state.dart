
abstract class OfficeForgetPasswordState {}

class InitialState extends OfficeForgetPasswordState {}


class OnForgetPasswordLoadingState extends OfficeForgetPasswordState {}

class OnForgetPasswordSuccessState extends OfficeForgetPasswordState {
  String message;

  OnForgetPasswordSuccessState({required this.message});
}

class OnForgetPasswordErrorState extends OfficeForgetPasswordState {
  String message;

  OnForgetPasswordErrorState({required this.message});
}

class OnForgetPasswordCatchErrorState extends OfficeForgetPasswordState {
  String message;

  OnForgetPasswordCatchErrorState({required this.message});
}
