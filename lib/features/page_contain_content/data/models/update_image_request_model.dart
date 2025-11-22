class UpdateImageRequestModel {

  String image;

  UpdateImageRequestModel({
    required this.image,
  });

  Map<String, dynamic> toJson() => {
    "image": image,
  };
}
