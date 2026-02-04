import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/cv_details/data/models/cv_details_response_model.dart';
import 'package:mery_comercial_app/features/cv_details/data/services/cv_details_service.dart';

class CvDetailsRepo {
  final CvDetailsService _cvDetailsService;

  CvDetailsRepo(this._cvDetailsService);

  Future<Either<Failure, CvDetailsResponseModel>> cvDetails(
    int id,
  ) async {
    try {
      return Right(await _cvDetailsService.cvDetails(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
