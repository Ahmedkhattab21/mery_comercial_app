import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/cv_details/data/models/cv_details_response_model.dart';
import 'package:mery_comercial_app/features/cv_details/data/services/cv_details_service.dart';
import 'package:mery_comercial_app/features/notifications/data/services/notifications_service.dart';

class NotificationsRepo {
  final NotificationsService _notificationsService;

  NotificationsRepo(this._notificationsService);

  Future<Either<Failure, CvDetailsResponseModel>> cvDetails(
    int id,
  ) async {
    try {
      return Right(await _notificationsService.cvDetails(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
