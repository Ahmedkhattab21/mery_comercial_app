abstract class RegisterState {}

class InitialState extends RegisterState {}

class IsPasswordVisibleState extends RegisterState {}

class OnChangeForgetMeState extends RegisterState {}

class OnRegisterLoadingState extends RegisterState {}

class OnRegisterSuccessState extends RegisterState {
  String message;

  OnRegisterSuccessState({required this.message});
}

class OnRegisterErrorState extends RegisterState {
  String message;

  OnRegisterErrorState({required this.message});
}

class OnRegisterCatchErrorState extends RegisterState {
  String message;

  OnRegisterCatchErrorState({required this.message});
}
