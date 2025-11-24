
import 'package:dartz/dartz.dart';
 import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/models/pages_response_model.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/services/page_contain_content_service.dart';

class PageContainContentRepo {
  final PageContainContentService _pageContainContentService;

  PageContainContentRepo(this._pageContainContentService);


  Future<Either<Failure, PagesResponseModel>> pages(int id) async {
    try {
      return Right(await _pageContainContentService.pages(id));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
