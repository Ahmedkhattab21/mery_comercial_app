import 'package:mery_comercial_app/core/api/end_points.dart';

class CvDetailsApiEndPoints {
  static cvDetailsUrl(int id) =>
      '${EndPoints.baseUrl}public/api/v1/enduser/cvs/$id';
}
