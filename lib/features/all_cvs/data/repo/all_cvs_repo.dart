import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/all_cvs/data/models/all_cvs_response_model.dart';
import 'package:mery_comercial_app/features/all_cvs/data/services/all_cvs_service.dart';

class AllCvsRepo {
  final AllCvsService _allCvsService;

  AllCvsRepo(this._allCvsService);

  Future<Either<Failure, AllCvsResponseModel>> getNationalityCvs(
    String code,
    bool? isMuslim,
    bool? isExperience,
  ) async {
    try {
      return Right(await _allCvsService.getNationalityCvs(code, isMuslim, isExperience));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
