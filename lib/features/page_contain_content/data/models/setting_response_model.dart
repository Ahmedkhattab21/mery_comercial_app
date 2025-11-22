class SettingResponseModel {
  SettingModel settingModel;

  SettingResponseModel({
    required this.settingModel,
  });

  factory SettingResponseModel.fromJson(Map<String, dynamic> json) {
    return SettingResponseModel(

      settingModel: SettingModel.fromJson(json['data']),
   
    );
  }
}
class SettingModel {
  int id;
  String name;
  String phone;
  String address;
  String email;
  String lat;
  String lng;
  bool voting;
  String image;
  String imageUrl;
  String floorPlan;
  String floorPlanUrl;
  String about;
  String privacy;
  String terms;
  String website;

  Social social;

  SettingModel({
    required this.id,
    required this.name,
    required this.phone,
    required this.address,
    required this.email,
    required this.lat,
    required this.lng,
    required this.voting,
    required this.image,
    required this.imageUrl,
    required this.floorPlan,
    required this.floorPlanUrl,
    required this.about,
    required this.privacy,
    required this.terms,
    required this.social,
    required this.website,
  });

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(
      id: json['id'],
      name: json['name']??'',
      phone: json['phone']??'',
      address: json['address']??'',
      email: json['email']??'',
      lat: json['lat']??'',
      lng: json['lng']??'',
      voting: json['voting']??'',
      image: json['image']??'',
      imageUrl: json['image_url']??'',
      floorPlan: json['floor_plan']??'',
      floorPlanUrl: json['floor_plan_url']??'',
      about: json['about']??'',
      privacy: json['privacy']??'',
      terms: json['terms']??'',
      website: json['website']??'',
      social: Social.fromJson(json['social']),

    );
  }
}

class Social {
   String facebook;
   String instagram;
   String linkedin;
   String x;
   String youtube;
   String flickr;

  Social({
    required this.facebook,
    required this.instagram,
    required this.linkedin,
    required this.x,
    required this.youtube,
    required this.flickr,
  });

  factory Social.fromJson(Map<String, dynamic> json) {
    return Social(
      facebook: json['facebook']??'',
      instagram: json['instagram']??'',
      linkedin: json['linkedin']??'',
      x: json['x']??'',
      youtube: json['youtube']??'',
      flickr: json['flickr']??'',
    );
  }

 
}
