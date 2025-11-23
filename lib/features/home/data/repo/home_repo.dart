
import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/profile/data/services/profile_service.dart';

class ProfileRepo {
  final ProfileService _profileService;

  ProfileRepo(this._profileService);

  Future<Either<Failure, SuccessResponseModel>> logOut() async {
    try {
      return Right(await _profileService.logOut());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
