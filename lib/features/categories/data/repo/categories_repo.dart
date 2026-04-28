import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/categories/data/models/categories_response_model.dart';
import 'package:mery_comercial_app/features/categories/data/services/categories_service.dart';

class CategoriesRepo {
  final CategoriesService _categoriesService;

  CategoriesRepo(this._categoriesService);

  Future<Either<Failure, CategoriesResponseModel>> getCategories() async {
    try {
      return Right(await _categoriesService.getCategories());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
