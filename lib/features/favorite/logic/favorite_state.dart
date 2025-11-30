abstract class FavoriteState {}

class InitialState extends FavoriteState {}

class OnGetFavoritesLoadingState extends FavoriteState {}

class OnGetFavoritesErrorState extends FavoriteState {}

class OnGetFavoritesSuccessState extends FavoriteState {}

class OnGetFavoritesCatchErrorState extends FavoriteState {}

class OnRemoveFromFavoritesLoadingState extends FavoriteState {}

class OnRemoveFromFavoritesErrorState extends FavoriteState {}

class OnRemoveFromFavoritesSuccessState extends FavoriteState {}

class OnRemoveFromFavoritesCatchErrorState extends FavoriteState {}

class OnAddToBookingLoadingState extends FavoriteState {}

class OnAddToBookingErrorState extends FavoriteState {}

class OnAddToBookingSuccessState extends FavoriteState {}

class OnAddToBookingCatchErrorState extends FavoriteState {}
