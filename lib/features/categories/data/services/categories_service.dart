import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/categories/data/models/categories_response_model.dart';
import 'package:mery_comercial_app/features/categories/data/services/categories_api_end_points.dart';

class CategoriesService {
  ApiConsumer apiConsumer;

  CategoriesService({required this.apiConsumer});

  Future<CategoriesResponseModel> getCategories() async {
    final response = await apiConsumer.get(
      CategoriesApiEndPoints.getCategoriesUrl,
      null,
    );
    if (response.statusCode == StatusCode.ok) {
      return CategoriesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      print('Categories API error ${response.statusCode}: ${response.body}');
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
