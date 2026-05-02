import 'dart:convert';
import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/register/data/models/register_request_model.dart';
import 'package:mery_comercial_app/features/register/data/models/register_response_model.dart';
import 'package:mery_comercial_app/features/register/data/services/register_api_end_points.dart';

class RegisterService {
  ApiConsumer apiConsumer;

  RegisterService({required this.apiConsumer});

  Future<RegisterResponseModel> register(RegisterRequestModel parameter) async {
    final response = await apiConsumer.post(
      RegisterApiEndPoints.registerUrl,
      RegisterRequestModel(
        nationalId: parameter.nationalId,
        name: parameter.name,
        phone: parameter.phone,
        password: parameter.password,
      ).toJson(),
      {
        ConstantKeys.contentType: ConstantKeys.applicationJson,
      },
    );

    print(response.statusCode);
    print(response.body);

    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
