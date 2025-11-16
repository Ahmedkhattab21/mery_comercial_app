class LoginResponseModel {
  String message;
  UseModel useModel;

  LoginResponseModel({required this.useModel, required this.message});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        message: json['message'] ?? '',
        useModel: UseModel.fromJson(json['data']),
      );
}

class UseModel {
  String token;

  UseModel({required this.token});

  factory UseModel.fromJson(Map<String, dynamic> json) =>
      UseModel(token: json['token']);
}
