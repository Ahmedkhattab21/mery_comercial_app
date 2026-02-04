import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/cv_details/data/models/cv_details_response_model.dart'
    as cvd;
import 'package:mery_comercial_app/features/cv_details/data/repo/cv_details_repo.dart';
import 'package:mery_comercial_app/features/cv_details/logic/cv_details_state.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';

class CvDetailsCubit extends Cubit<CvDetailsState> {
  final FavoriteRepo _favoriteRepo;
  final BookingRepo _bookingRepo;
  final CvDetailsRepo _cvDetailsRepo;

  CvDetailsCubit(this._favoriteRepo, this._bookingRepo, this._cvDetailsRepo)
    : super(InitialState());

  cvd.CV? cvDetailsResponseModel;

  getCvDetails(int id) {
    emit(OnGetDetailsLoadingState());
    _cvDetailsRepo
        .cvDetails(id)
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetDetailsErrorState());
            },
            (r) {
              cvDetailsResponseModel = r.data;
              emit(OnGetDetailsSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetDetailsCatchErrorState());
        });
  }

  addToFavorite(BuildContext context, int id) {
    emit(OnAddToFavoritesLoadingState());
    _favoriteRepo
        .addToFavorite(AddFavoriteRequestModel(cvId: id))
        .then((value) {
          value.fold(
            (l) {
              emit(OnAddToFavoritesErrorState());
            },
            (r) {
              AppConstant.toast(
                'تم اضافة السيرة الذاتيه الي المفضلة',
                true,
                context,
              );
              emit(OnAddToFavoritesSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnAddToFavoritesCatchErrorState());
        });
  }

  addBooking(BuildContext context, int id) {
    emit(OnAddToBookingLoadingState());
    _bookingRepo
        .addBooking(BookingRequestModel(cvId: id))
        .then((value) {
          value.fold(
            (l) {
              AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
              emit(OnAddToBookingErrorState());
            },
            (r) {
              AppConstant.toast('تم طلب السيرة الذاتيه', true, context);
              emit(OnAddToBookingSuccessState());
            },
          );
        })
        .catchError((error) {
          AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
          emit(OnAddToBookingCatchErrorState());
        });
  }

  static CvDetailsCubit get(context) => BlocProvider.of(context);
}
