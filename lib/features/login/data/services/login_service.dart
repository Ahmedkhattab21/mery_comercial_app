import 'dart:convert';
import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/login/data/models/login_request_model.dart';
import 'package:mery_comercial_app/features/login/data/models/login_response_model.dart';
import 'package:mery_comercial_app/features/login/data/services/login_api_end_points.dart';

class LoginService {
  ApiConsumer apiConsumer;

  LoginService({required this.apiConsumer});

  Future<LoginResponseModel> login(
    LoginRequestModel parameter
  ) async {
    final response = await apiConsumer.post(
      LoginApiEndPoints.loginURl,
      LoginRequestModel(
        nationalId: parameter.nationalId,
        password: parameter.password,
        fcm: parameter.fcm,
      ).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );


    if (response.statusCode == StatusCode.ok) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
