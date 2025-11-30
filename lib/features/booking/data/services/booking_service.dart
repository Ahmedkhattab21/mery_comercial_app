import 'dart:convert';

import 'package:mery_comercial_app/core/api/api_consumer.dart';
import 'package:mery_comercial_app/core/api/status_code.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/core/services/cache_helper.dart';
import 'package:mery_comercial_app/core/utils/constant_keys.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/services/booking_api_end_points.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';

class BookingService{
  ApiConsumer apiConsumer;

  BookingService({required this.apiConsumer});

  Future<GetFavoriteResponseModel> getBooking() async {
    final response = await apiConsumer.get(BookingApiEndPoints.getBookingUrl, {
      ConstantKeys.appAuthorization:
          "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
    });

    if (response.statusCode == StatusCode.ok) {
      return GetFavoriteResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }

  Future<SuccessResponseModel> addBooking(
      BookingRequestModel parameter,
  ) async {
    final response = await apiConsumer.post(
      BookingApiEndPoints.addBookingUrl,
      BookingRequestModel(cvId: parameter.cvId).toJson(),
      {
        ConstantKeys.appAuthorization:
            "${ConstantKeys.appBearer} ${await CacheHelper.getSecuredString(ConstantKeys.saveTokenToShared)}",
      },
    );

    if (response.statusCode == StatusCode.ok ||
        response.statusCode == StatusCode.created) {
      return SuccessResponseModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException(
        serverFailure: ServerFailure.fromJson(jsonDecode(response.body)),
      );
    }
  }
}
