class AddFavoriteRequestModel {
  int cvId;

  AddFavoriteRequestModel({required this.cvId});

  Map<String, dynamic> toJson() => {"cv_id": cvId};
}
