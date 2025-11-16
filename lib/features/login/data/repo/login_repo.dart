import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/login/data/models/login_request_model.dart';
import 'package:mery_comercial_app/features/login/data/models/login_response_model.dart';
import 'package:mery_comercial_app/features/login/data/services/login_service.dart';

class LoginRepo {
  final LoginService _loginService;

  LoginRepo(this._loginService);

  Future<Either<Failure, LoginResponseModel>> login(
      LoginRequestModel parameter
  ) async {
    try {
      return Right(await _loginService.login(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
