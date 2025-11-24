import 'package:mery_comercial_app/core/api/end_points.dart';

class UserDataResponseModel {
  UserData data;

  UserDataResponseModel({required this.data});

  factory UserDataResponseModel.fromJson(Map<String, dynamic> json) =>
      UserDataResponseModel(data: UserData.fromJson(json['data']));
}

class UserData {
  int id;
  String name;
  String phone;
  String nationalId;

  UserData({
    required this.id,
    required this.name,
    required this.phone,
    required this.nationalId,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'],
    name: json['name'] ?? "",
    phone: json['phone'] ?? "",
    nationalId: json['national_id'] ?? "",
  );
}
