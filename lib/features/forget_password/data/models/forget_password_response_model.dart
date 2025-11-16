class ForgetPasswordResponseModel {
  String message;
  UseModel useModel;

  ForgetPasswordResponseModel({
    required this.useModel,
    required this.message,
  });

  factory ForgetPasswordResponseModel.fromJson(
    Map<String, dynamic> json,
  ) => ForgetPasswordResponseModel(
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
