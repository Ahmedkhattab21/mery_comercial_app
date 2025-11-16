class LoginRequestModel {
  String nationalId;
  String password;

  LoginRequestModel({required this.nationalId, required this.password});

  Map<String, dynamic> toJson() => {"national_id": nationalId, "password": password};
}
