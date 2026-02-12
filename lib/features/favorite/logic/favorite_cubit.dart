import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/favorite/logic/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;
  final BookingRepo _bookingRepo;

  FavoriteCubit(this._favoriteRepo, this._bookingRepo) : super(InitialState());

  List<Favorite> favorites = [];

  getFavorites() {
    favorites = [];
    emit(OnGetFavoritesLoadingState());
    _favoriteRepo
        .getFavorites()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetFavoritesErrorState());
            },
            (r) async {
              favorites = r.data;
              emit(OnGetFavoritesSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetFavoritesCatchErrorState());
        });
  }

  removeFavorites(BuildContext context, int id) {
    emit(OnRemoveFromFavoritesLoadingState());
    _favoriteRepo
        .removeFavorites(id)
        .then((value) {
          value.fold(
            (l) {
              emit(OnRemoveFromFavoritesErrorState());
            },
            (r) {
              AppConstant.toast(
                'تم ازالة السيرة الذاتيه من المفضلة',
                true,
                context,
              );
              getFavorites();
              emit(OnRemoveFromFavoritesSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnRemoveFromFavoritesCatchErrorState());
        });
  }

  int? bookingLoadingId;

  addBooking(BuildContext context, int id) {
    bookingLoadingId = id;
    emit(OnAddToBookingLoadingState());
    _bookingRepo
        .addBooking(BookingRequestModel(cvId: id))
        .then((value) {
          value.fold(
            (l) {
              bookingLoadingId = null;
              AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
              emit(OnAddToBookingErrorState());
            },
            (r) {
              bookingLoadingId = null;
              AppConstant.toast('تم طلب السيرة الذاتيه', true, context);
              emit(OnAddToBookingSuccessState());
            },
          );
        })
        .catchError((error) {
          bookingLoadingId = null;
          AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
          emit(OnAddToBookingCatchErrorState());
        });
  }

  static FavoriteCubit get(context) => BlocProvider.of(context);
}
