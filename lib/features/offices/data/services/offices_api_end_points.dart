import 'package:mery_comercial_app/core/api/end_points.dart';

class OfficesApiEndPoints {
  static String getOfficesUrl({String? q, int? cityId, int perPage = 15}) {
    final params = <String, String>{'per_page': perPage.toString()};
    if (q != null && q.isNotEmpty) params['q'] = q;
    if (cityId != null) params['city_id'] = cityId.toString();
    final query = params.entries.map((e) => '${e.key}=${e.value}').join('&');
    return '${EndPoints.baseUrl}public/api/v1/public/offices?$query';
  }

  static String getOfficeDetailsUrl(int id) =>
      '${EndPoints.baseUrl}public/api/v1/public/offices/$id';
}
