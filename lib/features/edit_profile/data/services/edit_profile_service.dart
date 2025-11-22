import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/edit_profile/data/models/update_user_data_request_model.dart';
import 'package:mery_comercial_app/features/edit_profile/data/models/user_data_response_model.dart';
import 'package:mery_comercial_app/features/edit_profile/data/services/edit_profile_api_end_points.dart';

class EditProfileService {
  ApiConsumer apiConsumer;

  EditProfileService({required this.apiConsumer});

  Future<UserDataResponseModel> getUserData() async {
    final response = await apiConsumer.get(EditProfileApiEndPoints.getMyDataUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == StatusCode.ok) {
      return UserDataResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

  Future<SuccessResponseModel> updateProfile(
    UpdateUserDataRequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      EditProfileApiEndPoints.updateProfileUrl,
      UpdateUserDataRequestModel(
        email: parameter.email,
        password: parameter.password,
        name: parameter.name,
        phone: parameter.phone,
        countryCode: parameter.countryCode,
        job: parameter.job,
      ).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
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
