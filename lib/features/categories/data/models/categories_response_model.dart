class CategoriesResponseModel {
  String status;
  String message;
  List<Category> data;

  CategoriesResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesResponseModel.fromJson(Map<String, dynamic> json) {
    return CategoriesResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => Category.fromJson(e))
          .toList(),
    );
  }
}

class Category {
  int id;
  String name;
  String? imageUrl;

  Category({required this.id, required this.name, this.imageUrl});

  factory Category.fromJson(Map<String, dynamic> json) {
    final raw = json['icon'] ?? json['image_url'] ?? json['image'];
    String? imageUrl;
    if (raw != null && raw.toString().isNotEmpty) {
      if (raw.toString().startsWith('http')) {
        imageUrl = raw.toString();
      } else {
        imageUrl = 'https://mery.alemtayaz.com/public/${raw.toString()}';
      }
    }
    return Category(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      imageUrl: imageUrl,
    );
  }
}
