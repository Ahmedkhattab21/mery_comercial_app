import 'package:dartz/dartz.dart';
import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/services/booking_service.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';

class BookingRepo {
  final BookingService _bookingService;

  BookingRepo(this._bookingService);

  Future<Either<Failure, GetFavoriteResponseModel>> getBooking() async {
    try {
      return Right(await _bookingService.getBooking());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> addToFavorite(
    BookingRequestModel parameter,
  ) async {
    try {
      return Right(await _bookingService.addBooking(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
