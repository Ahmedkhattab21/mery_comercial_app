class UpdateUserDataRequestModel {
  String? email;
  String? name;
  String? phone;
  String? countryCode;
  String? job;
  String? password;

  UpdateUserDataRequestModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.countryCode,
    required this.job,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    if (email != null) "email": email,
    if (name != null) "name": name,
    if (phone != null) "phone": phone,
    if (countryCode != null) "country_code": countryCode,
    if (job != null) "job": job,
    if (password != null) "password": password,
    if (password != null) "password_confirmation": password,
  };
}
