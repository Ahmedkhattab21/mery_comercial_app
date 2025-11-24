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
  UseData userData;

  UseModel({required this.token, required this.userData});

  factory UseModel.fromJson(Map<String, dynamic> json) =>
      UseModel(token: json['token'], userData: UseData.fromJson(json['user']));
}

class UseData {
  String name;

  UseData({required this.name});

  factory UseData.fromJson(Map<String, dynamic> json) =>
      UseData(name: json['name']);
}
