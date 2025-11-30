import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/services/favorite_service.dart';

class FavoriteRepo {
  final FavoriteService _favoriteService;

  FavoriteRepo(this._favoriteService);

  Future<Either<Failure, GetFavoriteResponseModel>> getFavorites() async {
    try {
      return Right(await _favoriteService.getFavorites());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> addToFavorite(
    AddFavoriteRequestModel parameter,
  ) async {
    try {
      return Right(await _favoriteService.addToFavorite(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> removeFavorites(int id) async {
    try {
      return Right(await _favoriteService.removeFavorites(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
