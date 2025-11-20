class ResetPasswordRequestModel {
  String token;
  String password;

  ResetPasswordRequestModel({required this.token, required this.password});

  Map<String, dynamic> toJson() => {
    "reset_token": token,
    "password": password,
    "password_confirmation": password,
  };
}
