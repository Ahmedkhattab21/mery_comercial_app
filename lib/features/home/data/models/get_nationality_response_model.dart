class GetNationalityResponseModel {
  String status;
  String message;
  List<Nationality> data;

  GetNationalityResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetNationalityResponseModel.fromJson(Map<String, dynamic> json) {
    return GetNationalityResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>).map((e) => Nationality.fromJson(e)).toList(),
    );
  }
}

class Nationality {
  int id;
  String code;
  String name;
  String image;

  Nationality({required this.id, required this.code, required this.image, required this.name});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      image: json['image'] ?? '',
      name: json['name'] ?? '',
    );
  }
}
