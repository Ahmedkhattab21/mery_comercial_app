class LoginRequestModel {
  String nationalId;
  String password;
  String fcm;

  LoginRequestModel({required this.nationalId, required this.password, required this.fcm});

  Map<String, dynamic> toJson() => {"national_id": nationalId, "password": password, "fcm": fcm};
}
