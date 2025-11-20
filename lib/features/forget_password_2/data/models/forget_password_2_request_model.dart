class ForgetPassword2RequestModel {
  String token;
  String phone;

  ForgetPassword2RequestModel({required this.token, required this.phone});

  Map<String, dynamic> toJson() => {"token": token, "phone": phone};
}
