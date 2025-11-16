import 'dart:convert';
import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_dashboard/core/api/api_consumer.dart';
import 'package:mery_dashboard/core/api/status_code.dart';
import 'package:mery_dashboard/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_dashboard/core/exceptions/exceptions.dart';
import 'package:mery_dashboard/core/exceptions/failure.dart';
import 'package:mery_dashboard/core/services/cache_helper.dart';
import 'package:mery_dashboard/core/utils/constant_keys.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/models/forget_password_request_model.dart';
import 'package:mery_dashboard/features/office/office_auth/office_forget_password/data/services/forget_password_api_end_points.dart';

class ForgetPasswordService {
  ApiConsumer apiConsumer;

  ForgetPasswordService({required this.apiConsumer});

  Future<SuccessResponseModel> forgetPassword(
    OfficeForgetPasswordRequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      OfficeForgetPasswordApiEndPoints.forgetPasswordUrl,
      OfficeForgetPasswordRequestModel(email: parameter.email).toJson(),
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
