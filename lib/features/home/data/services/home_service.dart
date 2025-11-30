import 'dart:convert';
import 'dart:io';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
 import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/home/data/models/get_cvs_response_model.dart';
import 'package:mery_comercial_app/features/home/data/models/get_nationality_response_model.dart';
import 'package:mery_comercial_app/features/home/data/models/get_sliders_response_model.dart';
import 'package:mery_comercial_app/features/home/data/services/home_api_end_points.dart';

class HomeService {
  ApiConsumer apiConsumer;

  HomeService({required this.apiConsumer});

  Future<GetNationalityResponseModel> getNationality() async {
    final response = await apiConsumer.get(
      HomeApiEndPoints.getNationalityUrl,
      {
        ConstantKeys.appAuthorization:
        "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(
            ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return GetNationalityResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
  Future<GetCvsResponseModel> getCV() async {
    final response = await apiConsumer.get(
      HomeApiEndPoints.getCVUrl,
      {
        ConstantKeys.appAuthorization:
        "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(
            ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return GetCvsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
  Future<GetSlidersResponseModel> getSliders() async {
    final response = await apiConsumer.get(
      HomeApiEndPoints.getSlidersUrl,
      {
        ConstantKeys.appAuthorization:
        "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(
            ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return GetSlidersResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

}
