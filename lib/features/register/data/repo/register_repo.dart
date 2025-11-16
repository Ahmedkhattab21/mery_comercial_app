import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/register/data/models/register_request_model.dart';
import 'package:mery_comercial_app/features/register/data/models/register_response_model.dart';
import 'package:mery_comercial_app/features/register/data/services/register_service.dart';

class RegisterRepo {
  final RegisterService _registerService;

  RegisterRepo(this._registerService);

  Future<Either<Failure, RegisterResponseModel>> register(
      RegisterRequestModel parameter,
  ) async {
    try {
      return Right(await _registerService.register(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

}
