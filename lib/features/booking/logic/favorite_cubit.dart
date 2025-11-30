import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/core/utils/app_constant.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/favorite/logic/favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;

  FavoriteCubit(this._favoriteRepo) : super(InitialState());

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

  static FavoriteCubit get(context) => BlocProvider.of(context);
}
