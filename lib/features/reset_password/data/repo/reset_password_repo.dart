import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
   import 'package:mery_comercial_app/features/reset_password/data/models/reset_password_request_model.dart';
import 'package:mery_comercial_app/features/reset_password/data/services/reset_password_service.dart';


class ResetPasswordRepo {
  final ResetPasswordService _resetPasswordService;

  ResetPasswordRepo(this._resetPasswordService);

  Future<Either<Failure, SuccessResponseModel>> resetPassword(
      ResetPasswordRequestModel parameter,
  ) async {
    try {
      return Right(await _resetPasswordService.resetPassword(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
