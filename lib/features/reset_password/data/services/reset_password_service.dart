import 'dart:convert';
import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/forget_password/data/models/forget_password_request_model.dart';
import 'package:mery_comercial_app/features/forget_password/data/models/forget_password_response_model.dart';
import 'package:mery_comercial_app/features/forget_password/data/services/forget_password_api_end_points.dart';
import 'package:mery_comercial_app/features/reset_password/data/models/reset_password_request_model.dart';
import 'package:mery_comercial_app/features/reset_password/data/services/reset_password_api_end_points.dart';

class ResetPasswordService {
  ApiConsumer apiConsumer;

  ResetPasswordService({required this.apiConsumer});

  Future<SuccessResponseModel> resetPassword(
    ResetPasswordRequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      ResetPasswordApiEndPoints.resetPasswordUrl,
      ResetPasswordRequestModel(
        token: parameter.token,
        password: parameter.password,
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
