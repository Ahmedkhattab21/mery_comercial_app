class ForgetPasswordResponseModel {
  String message;
  TokenModel tokenModel;

  ForgetPasswordResponseModel({
    required this.tokenModel,
    required this.message,
  });

  factory ForgetPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgetPasswordResponseModel(
        message: json['message'] ?? '',
        tokenModel: TokenModel.fromJson(json['data']),
      );
}

class TokenModel {
  String token;

  TokenModel({required this.token});

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      TokenModel(token: json['token']);
}