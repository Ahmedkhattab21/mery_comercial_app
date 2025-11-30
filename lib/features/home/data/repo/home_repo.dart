import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/home/data/models/get_cvs_response_model.dart';
import 'package:mery_comercial_app/features/home/data/models/get_nationality_response_model.dart';
import 'package:mery_comercial_app/features/home/data/models/get_sliders_response_model.dart';
import 'package:mery_comercial_app/features/home/data/services/home_service.dart';

class HomeRepo {
  final HomeService _homeService;

  HomeRepo(this._homeService);

  Future<Either<Failure, GetNationalityResponseModel>> getNationality() async {
    try {
      return Right(await _homeService.getNationality());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, GetCvsResponseModel>> getCV() async {
    try {
      return Right(await _homeService.getCV());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
  Future<Either<Failure, GetSlidersResponseModel>> getSliders() async {
    try {
      return Right(await _homeService.getSliders());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
