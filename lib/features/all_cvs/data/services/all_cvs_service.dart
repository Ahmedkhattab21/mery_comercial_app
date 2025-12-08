import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/all_cvs/data/models/all_cvs_response_model.dart';
import 'package:mery_comercial_app/features/all_cvs/data/services/all_cvs_api_end_points.dart';

class AllCvsService {
  ApiConsumer apiConsumer;

  AllCvsService({required this.apiConsumer});

  Future<AllCvsResponseModel> getNationalityCvs(
    String code,
    bool? isMuslim,
    bool? isExperience,
  ) async {
    final response = await apiConsumer.get(
      AllCvsApiEndPoints.getNationalityCvsUrl(code, isMuslim, isExperience),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return AllCvsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
