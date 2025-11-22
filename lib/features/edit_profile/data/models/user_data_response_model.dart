
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
  String email;
  String phone;
  String countryCode;
  String job;
  String status;
  String img;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.countryCode,
    required this.job,
    required this.status,
    required this.img,
  });

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
    id: json['id'],
    name: json['name'] ?? "",
    email: json['email'] ?? "",
    phone: json['phone'] ?? "",
    countryCode: json['country_code'] ?? "",
    job: json['job'] ?? "",
    status: json['status'] ?? "",
    img: EndPoints.getImageFromApi(json['img'] ?? ''),
  );
}
