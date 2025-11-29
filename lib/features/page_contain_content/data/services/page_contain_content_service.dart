import 'dart:convert';
import 'dart:io';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
 import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/models/pages_response_model.dart';
import 'package:mery_comercial_app/features/page_contain_content/data/services/page_contain_content_api_end_points.dart';

class PageContainContentService {
  ApiConsumer apiConsumer;

  PageContainContentService({required this.apiConsumer});


  Future<PagesResponseModel> pages(int id) async {
    final response = await apiConsumer.get(
      PageContainContentApiEndPoints.pagesUrl(id),

      {
        ConstantKeys.appAuthorization:
        "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(
            ConstantKeys.saveTokenToShared)}",
      },
    );
    if (response.statusCode == StatusCode.ok) {
      return PagesResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

}
