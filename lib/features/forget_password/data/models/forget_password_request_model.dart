class ForgetPasswordRequestModel {
  String nationalId;

  ForgetPasswordRequestModel({required this.nationalId});

  Map<String, dynamic> toJson() => {"national_id": nationalId};
}
