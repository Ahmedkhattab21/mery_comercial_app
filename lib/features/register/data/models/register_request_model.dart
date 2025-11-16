class RegisterRequestModel {
  String nationalId;
  String name;
  String phone;
  String password;

  RegisterRequestModel({
    required this.nationalId,
    required this.name,
    required this.phone,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    "national_id": nationalId,
    "name": name,
    "phone": phone,
    "password": password,
    "password_confirmation": password,
  };
}
