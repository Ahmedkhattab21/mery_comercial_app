class RegisterResponseModel {
  String message;
  UseModel useModel;

  RegisterResponseModel({required this.useModel, required this.message});

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
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

