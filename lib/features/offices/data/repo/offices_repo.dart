import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';
import 'package:mery_comercial_app/features/offices/data/services/offices_service.dart';

class OfficesRepo {
  final OfficesService _officesService;

  OfficesRepo(this._officesService);

  Future<Either<Failure, OfficesResponseModel>> getOffices({
    String? q,
    int? cityId,
    int perPage = 15,
  }) async {
    try {
      return Right(
        await _officesService.getOffices(q: q, cityId: cityId, perPage: perPage),
      );
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, OfficeDetailsResponseModel>> getOfficeDetails(
    int id,
  ) async {
    try {
      return Right(await _officesService.getOfficeDetails(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
