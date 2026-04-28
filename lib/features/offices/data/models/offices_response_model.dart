class OfficesResponseModel {
  String status;
  String message;
  List<Office> data;

  OfficesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OfficesResponseModel.fromJson(Map<String, dynamic> json) {
    return OfficesResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Office.fromJson(e))
          .toList(),
    );
  }
}

class OfficeDetailsResponseModel {
  String status;
  String message;
  Office data;

  OfficeDetailsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory OfficeDetailsResponseModel.fromJson(Map<String, dynamic> json) {
    return OfficeDetailsResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: Office.fromJson(json['data']),
    );
  }
}

class Office {
  int id;
  String name;
  String? phone;
  String? address;
  String? email;
  String? imageUrl;
  int? cityId;

  Office({
    required this.id,
    required this.name,
    this.phone,
    this.address,
    this.email,
    this.imageUrl,
    this.cityId,
  });

  factory Office.fromJson(Map<String, dynamic> json) {
    return Office(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      phone: json['phone'],
      address: json['address'],
      email: json['email'],
      imageUrl: json['image_url'],
      cityId: json['city_id'],
    );
  }
}
