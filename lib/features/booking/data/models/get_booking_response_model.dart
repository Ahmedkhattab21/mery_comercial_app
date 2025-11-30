class GetBookingResponseModel {
  String status;
  String message;
  BookData bookData;

  GetBookingResponseModel({
    required this.status,
    required this.message,
    required this.bookData,
  });

  factory GetBookingResponseModel.fromJson(Map<String, dynamic> json) {
    return GetBookingResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      bookData: BookData.fromJson(json['data']),
    );
  }
}

class BookData {
  List<BookingModel> bookings;

  BookData({required this.bookings});

  factory BookData.fromJson(Map<String, dynamic> json) {
    return BookData(
      bookings: (json['data'] as List<dynamic>)
          .map((e) => BookingModel.fromJson(e))
          .toList(),
    );
  }
}

class BookingModel {
  int id;
  String status;
  String createdAt;
  CvModel cv;

  BookingModel({
    required this.id,
    required this.status,
    required this.createdAt,
    required this.cv,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'] ?? 0,
      status: json['status'] ?? '',
      createdAt: json['created_at'] ?? '',
      cv: CvModel.fromJson(json['cv']),
    );
  }
}

class CvModel {
  int id;
  Nationality nationality;
  CvFile cvFile;
  bool hasExperience;
  bool isMuslim;
  int approvedBy;

  CvModel({
    required this.id,
    required this.nationality,
    required this.cvFile,
    required this.hasExperience,
    required this.isMuslim,
    required this.approvedBy,
  });

  factory CvModel.fromJson(Map<String, dynamic> json) {
    return CvModel(
      id: json['id'] ?? 0,
      nationality: Nationality.fromJson(json['nationality']),
      cvFile: CvFile.fromJson(json['file']),
      hasExperience: json['has_experience'] ?? false,
      isMuslim: json['is_muslim'] ?? false,
      approvedBy: json['approved_by'] ?? 0,
    );
  }
}

class CvFile {
  String path;
  String mime;
  int size;
  String name;
  String url;

  CvFile({
    required this.path,
    required this.mime,
    required this.size,
    required this.name,
    required this.url,
  });

  factory CvFile.fromJson(Map<String, dynamic> json) {
    return CvFile(
      path: json['path'] ?? '',
      mime: json['mime'] ?? '',
      size: json['size'] ?? 0,
      name: json['original'] ?? '',
      url: json['url'] ?? '',
    );
  }
}

class Nationality {
  String name;
  String code;
  String image;

  Nationality({
    required this.name,
    required this.code,
    required this.image,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      name: json['translations']?['ar'] ?? json['name'] ?? '',
      code: json['code'] ?? '',
      image: json['image'] ?? '',
    );
  }
}
