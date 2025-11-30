import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/favorite/data/models/add_favorite_request_model.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/home/data/models/get_cvs_response_model.dart'
    as cv;
import 'package:mery_comercial_app/features/home/data/models/get_nationality_response_model.dart'
    as nationality;
import 'package:mery_comercial_app/features/home/data/repo/home_repo.dart';
import 'package:mery_comercial_app/features/home/logic/home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  final FavoriteRepo _favoriteRepo;

  HomeCubit(this._homeRepo, this._favoriteRepo) : super(InitialState());

  List<nationality.Nationality> nationalities = [];

  getNationality() {
    emit(OnGetNationalityLoadingState());
    _homeRepo
        .getNationality()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetNationalityErrorState());
            },
            (r) async {
              nationalities = r.data;
              emit(OnGetNationalitySuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetNationalityCatchErrorState());
        });
  }

  List<cv.CV> cvs = [];

  getCV() {
    emit(OnGetCVSLoadingState());
    _homeRepo
        .getCV()
        .then((value) {
          value.fold(
            (l) {
              emit(OnGetCVSErrorState());
            },
            (r) async {
              cvs = r.data;
              emit(OnGetCVSSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnGetCVSCatchErrorState());
        });
  }

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
              getFavorites();
              emit(OnAddToFavoritesSuccessState());
            },
          );
        })
        .catchError((error) {
          emit(OnAddToFavoritesCatchErrorState());
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

  static HomeCubit get(context) => BlocProvider.of(context);
}
