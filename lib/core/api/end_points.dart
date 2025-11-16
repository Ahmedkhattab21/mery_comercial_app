
class EndPoints {
  static const String baseUrl = "https://mery.alemtayaz.com/";
  static const String _imageBaseUrl = "storage/app/public/";

  static String getImageFromApi(String imageUrl) {
    return baseUrl + _imageBaseUrl + imageUrl;
  }
}

