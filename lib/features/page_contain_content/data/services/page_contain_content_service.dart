import 'dart:convert';
import 'dart:io';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/profile/data/services/profile_api_end_points.dart';

class PageContainContentService {
  ApiConsumer apiConsumer;

  PageContainContentService({required this.apiConsumer});

  Future<SuccessResponseModel> logOut() async {
    final response = await apiConsumer.post(
      ProfileApiEndPoints.logOutUrl,
      null,
      {
        ConstantKeys.appAuthorization:
        "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(
            ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

}
