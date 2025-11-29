import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/services/favorite_api_end_points.dart';

class FavoriteService {
  ApiConsumer apiConsumer;

  FavoriteService({required this.apiConsumer});

  Future<GetFavoriteResponseModel> getFavorites() async {
    final response = await apiConsumer.get(FavoriteApiEndPoints.getFavoritesUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });

    if (response.statusCode == StatusCode.ok) {
      return GetFavoriteResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

  Future<SuccessResponseModel> addToFavorite(
    AddFavoriteRequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      FavoriteApiEndPoints.addFavoritesUrl,
      AddFavoriteRequestModel(cvId: parameter.cvId).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
