class GetSlidersResponseModel {
  String status;
  String message;
  List<Slider> data;

  GetSlidersResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetSlidersResponseModel.fromJson(Map<String, dynamic> json) {
    return GetSlidersResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>)
          .map((e) => Slider.fromJson(e))
          .toList(),
    );
  }
}

class Slider {
  int id;
  String image;

  Slider({required this.id, required this.image});

  factory Slider.fromJson(Map<String, dynamic> json) {
    return Slider(id: json['id'], image: json['image'] ?? '');
  }
}
