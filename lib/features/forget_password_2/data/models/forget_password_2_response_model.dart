class ForgetPassword2ResponseModel {
  String message;
  TokenModel tokenModel;

  ForgetPassword2ResponseModel({
    required this.tokenModel,
    required this.message,
  });

  factory ForgetPassword2ResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgetPassword2ResponseModel(
        message: json['message'] ?? '',
        tokenModel: TokenModel.fromJson(json['data']),
      );
}

class TokenModel {
  String resetToken;

  TokenModel({required this.resetToken});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(resetToken: json['reset_token']);
}

