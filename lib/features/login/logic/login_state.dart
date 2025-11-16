
abstract class LoginState {}

class InitialState extends LoginState {}

class IsPasswordVisibleState extends LoginState {}
class OnChangeForgetMeState extends LoginState {}

class OnLoginLoadingState extends LoginState {}

class OnLoginSuccessState extends LoginState {}

class OnLoginErrorState extends LoginState {}

class OnLoginCatchErrorState extends LoginState {}
