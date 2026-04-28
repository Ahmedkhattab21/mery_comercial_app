import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';
import 'package:mery_comercial_app/features/offices/data/services/offices_api_end_points.dart';

class OfficesService {
  ApiConsumer apiConsumer;

  OfficesService({required this.apiConsumer});

  Future<OfficesResponseModel> getOffices({
    String? q,
    int? cityId,
    int perPage = 15,
  }) async {
    final response = await apiConsumer.get(
      OfficesApiEndPoints.getOfficesUrl(q: q, cityId: cityId, perPage: perPage),
      null,
    );
    if (response.statusCode == StatusCode.ok) {
      return OfficesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print('Offices API error ${response.statusCode}: ${response.body}');
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

  Future<OfficeDetailsResponseModel> getOfficeDetails(int id) async {
    final response = await apiConsumer.get(
      OfficesApiEndPoints.getOfficeDetailsUrl(id),
      null,
    );
    if (response.statusCode == StatusCode.ok) {
      return OfficeDetailsResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print('Office details error ${response.statusCode}: ${response.body}');
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
