class AllCvsResponseModel {
  String status;
  String message;
  List<CV> data;

  AllCvsResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AllCvsResponseModel.fromJson(Map<String, dynamic> json) {
    return AllCvsResponseModel(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>).map((e) => CV.fromJson(e)).toList(),
    );
  }
}

class CV {
  int id;
  Nationality nationality;
  CvFile cvFile;
  bool hasExperience;
  bool isMuslim;
  int approvedBy;

  CV({
    required this.id,
    required this.nationality,
    required this.cvFile,
    required this.hasExperience,
    required this.isMuslim,
    required this.approvedBy,
  });

  factory CV.fromJson(Map<String, dynamic> json) {
    return CV(
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
  String name;
  String url;

  CvFile({required this.name, required this.url});

  factory CvFile.fromJson(Map<String, dynamic> json) {
    return CvFile(name: json['original'] ?? '', url: json['url'] ?? '');
  }
}

class Nationality {
  String name;

  Nationality({required this.name});

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(name: json['name'] ?? '');
  }
}
