import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/favorite/data/models/get_favorite_response_model.dart';
import 'package:mery_comercial_app/features/favorite/data/repo/favorite_repo.dart';
import 'package:mery_comercial_app/features/favorite/logic/favorite_state.dart';


class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepo _favoriteRepo;

  FavoriteCubit(this._favoriteRepo) : super(InitialState());

  List<Favorite> favorites = [];
  getFavorites() {
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

  static FavoriteCubit get(context) => BlocProvider.of(context);
}
