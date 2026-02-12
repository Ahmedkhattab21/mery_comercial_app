import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/all_cvs/data/models/all_cvs_response_model.dart';
import 'package:mery_comercial_app/features/all_cvs/data/repo/all_cvs_repo.dart';
import 'package:mery_comercial_app/features/all_cvs/logic/all_cvs_state.dart';
import 'package:mery_comercial_app/features/booking/data/models/booking_request_model.dart';
import 'package:mery_comercial_app/features/booking/data/repo/booking_repo.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';

class AllCvsCubit extends Cubit<AllCvsState> {
  final FavoriteRepo _favoriteRepo;
  final AllCvsRepo _allCvsRepo;
  final BookingRepo _bookingRepo;

  AllCvsCubit(this._favoriteRepo, this._allCvsRepo, this._bookingRepo)
    : super(InitialState());

  List<CV> nationalityCvs = [];

  getNationalityCvs(String code) {
    nationalityCvs = [];
    emit(OnGetNationalityCvsLoadingState());
    _allCvsRepo
        .getNationalityCvs(code, isMuslims, isExperience)
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetNationalityCvsErrorState());
            },
            (r) async {
              nationalityCvs = r.data;
              emit(OnGetNationalityCvsSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetNationalityCvsCatchErrorState());
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
  int? bookingLoadingId;

  addBooking(BuildContext context, int id) {
    bookingLoadingId=id;
    emit(OnAddToBookingLoadingState());
    _bookingRepo
        .addBooking(BookingRequestModel(cvId: id))
        .then((value) {
          value.fold(
            (l) {
              bookingLoadingId=null;
              AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
              emit(OnAddToBookingErrorState());
            },
            (r) {
              bookingLoadingId=null;
              AppConstant.toast('تم طلب السيرة الذاتيه', true, context);
              emit(OnAddToBookingSuccessState());
            },
          );
        })
        .catchError((error) {
      bookingLoadingId=null;
          AppConstant.toast('تم طلب السيرة الذاتيه مسبقا', true, context);
          emit(OnAddToBookingCatchErrorState());
        });
  }

  bool? isMuslims;
  changeISMuslims(String code, bool value) {
    isMuslims = value;
    getNationalityCvs(code);
  }

  bool? isExperience;
  changeISExperience(String code, bool value) {
    isExperience = value;
    getNationalityCvs(code);
  }

  static AllCvsCubit get(context) => BlocProvider.of(context);
}
