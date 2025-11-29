abstract class FavoriteState {}

class InitialState extends FavoriteState {}


class OnGetFavoritesLoadingState extends FavoriteState {}
class OnGetFavoritesErrorState extends FavoriteState {}
class OnGetFavoritesSuccessState extends FavoriteState {}
class OnGetFavoritesCatchErrorState extends FavoriteState {}
