class UpdateUserDataRequestModel {
  String? name;
  String? phone;

  UpdateUserDataRequestModel({required this.name, required this.phone});

  Map<String, dynamic> toJson() => {
    if (name != null) "name": name,
    if (phone != null) "phone": phone,
  };
}
