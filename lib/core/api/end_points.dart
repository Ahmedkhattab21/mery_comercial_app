
class EndPoints {
  static const String baseUrl = "https://mery.alemtayaz.com/";
  static const String _imageBaseUrl = "storage/app/public/";

  static String getImageFromApi(String imageUrl) {
    if (imageUrl.startsWith('http')) {
      // API returns /storage/ but files are served under /public/storage/
      return imageUrl.replaceFirst('/storage/', '/public/storage/');
    }
    return baseUrl + _imageBaseUrl + imageUrl;
  }
}

