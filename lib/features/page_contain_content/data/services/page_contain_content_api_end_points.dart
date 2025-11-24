import 'package:mery_comercial_app/core/api/end_points.dart';

class PageContainContentApiEndPoints {
  static pagesUrl(int id) =>
      '${EndPoints.baseUrl}api/v1/admin/system/pages/$id';
}
