import 'package:mery_comercial_app/core/errors_and_success_response/success/success_response.dart';
import 'package:mery_comercial_app/core/exceptions/exceptions.dart';
import 'package:mery_comercial_app/core/exceptions/failure.dart';
import 'package:mery_comercial_app/features/edit_profile/data/models/update_user_data_request_model.dart';
import 'package:mery_comercial_app/features/edit_profile/data/models/user_data_response_model.dart';
import 'package:mery_comercial_app/features/edit_profile/data/services/edit_profile_service.dart';

import 'package:dartz/dartz.dart';

class EditProfileRepo {
  final EditProfileService _editProfileService;

  EditProfileRepo(this._editProfileService);

  Future<Either<Failure, UserDataResponseModel>> getUserData(
  ) async {
    try {
      return Right(await _editProfileService.getUserData());
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }

  Future<Either<Failure, SuccessResponseModel>> updateProfile(
    UpdateUserDataRequestModel parameter,
  ) async {
    try {
      return Right(await _editProfileService.updateProfile(parameter));
    } on ServerException catch (failure) {
      return Left(ServerFailure(message: failure.serverFailure.message));
    }
  }
}
