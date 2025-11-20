import 'dart:convert';
import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/models/forget_password_2_request_model.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/models/forget_password_2_response_model.dart';
import 'package:mery_comercial_app/features/forget_password_2/data/services/forget_password_2_api_end_points.dart';

class ForgetPassword2Service {
  ApiConsumer apiConsumer;

  ForgetPassword2Service({required this.apiConsumer});

  Future<ForgetPassword2ResponseModel> forgetPassword(
    ForgetPassword2RequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      ForgetPassword2ApiEndPoints.forgetPasswordUrl,
      ForgetPassword2RequestModel(token: parameter.token,phone: parameter.phone).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok) {
      return ForgetPassword2ResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
