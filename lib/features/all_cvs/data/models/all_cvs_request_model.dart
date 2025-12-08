class AllCvsRequestModel {
  int cvId;

  AllCvsRequestModel({required this.cvId});

  Map<String, dynamic> toJson() => {"cv_id": cvId};
}
