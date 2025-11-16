import 'package:dartz/dartz.dart';
import 'package:mery_dashboard/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_dashboard/core/exceptions/exceptions.dart';
import 'package:mery_dashboard/core/exceptions/failure.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/models/forget_password_request_model.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/services/forget_password_service.dart';

class ForgetPasswordRepo {
  final OfficeForgetPasswordService _officeForgetPasswordService;

  ForgetPasswordRepo(this._officeForgetPasswordService);

  Future<Either<Failure, SuccessResponseModel>> forgetPassword(
      OfficeForgetPasswordRequestModel parameter,
  ) async {
    try {
      return Right(await _officeForgetPasswordService.forgetPassword(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
