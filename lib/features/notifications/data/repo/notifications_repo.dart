import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/notifications/data/models/notification_response_model.dart';
import 'package:mery_comercial_app/features/notifications/data/services/notifications_service.dart';

class NotificationsRepo {
  final NotificationsService _notificationsService;

  NotificationsRepo(this._notificationsService);

  Future<Either<Failure, NotificationResponseModel>> getNotification(
    int page,
  ) async {
    try {
      return Right(await _notificationsService.getNotification(page));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
