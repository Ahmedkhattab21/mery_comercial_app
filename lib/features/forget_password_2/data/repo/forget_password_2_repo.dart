import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/models/forget_password_2_request_model.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/models/forget_password_2_response_model.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/services/forget_password_2_service.dart';


class ForgetPassword2Repo {
  final ForgetPassword2Service _forgetPassword2Service;

  ForgetPassword2Repo(this._forgetPassword2Service);

  Future<Either<Failure, ForgetPassword2ResponseModel>> forgetPassword(
      ForgetPassword2RequestModel parameter,
  ) async {
    try {
      return Right(await _forgetPassword2Service.forgetPassword(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
