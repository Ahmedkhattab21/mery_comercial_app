class PagesResponseModel {
  String message;
  PageData tokenModel;

  PagesResponseModel({required this.tokenModel, required this.message});

  factory PagesResponseModel.fromJson(Map<String, dynamic> json) =>
      PagesResponseModel(
        message: json['message'] ?? '',
        tokenModel: PageData.fromJson(json['data']),
      );
}

class PageData {
  int id;
  String metaTitle;
  String metaDescription;

  PageData({
    required this.id,
    required this.metaTitle,
    required this.metaDescription,
  });

  factory PageData.fromJson(Map<String, dynamic> json) => PageData(
    id: json['id'],
    metaTitle: json['meta_title'] ?? '',
    metaDescription: json['meta_description'] ?? '',
  );
}
