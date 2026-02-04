import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/cv_details/data/models/cv_details_response_model.dart';
import 'package:mery_comercial_app/features/cv_details/data/services/cv_details_api_end_points.dart';

class CvDetailsService {
  ApiConsumer apiConsumer;

  CvDetailsService({required this.apiConsumer});

  Future<CvDetailsResponseModel> cvDetails(int id) async {
    final response = await apiConsumer.get(
      CvDetailsApiEndPoints.cvDetailsUrl(id),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return CvDetailsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
