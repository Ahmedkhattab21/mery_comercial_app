import 'package:mery_comercial_app/core/api/end_points.dart';

class NotificationsApiEndPoints {
  static getNotificationUrl(int page) =>
      '${EndPoints.baseUrl}public/api/v1/enduser/notifications?page=$page';
}