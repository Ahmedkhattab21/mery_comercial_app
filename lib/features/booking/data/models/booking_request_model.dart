class BookingRequestModel {
  int cvId;

  BookingRequestModel({required this.cvId});

  Map<String, dynamic> toJson() => {"cv_id": cvId};
}
