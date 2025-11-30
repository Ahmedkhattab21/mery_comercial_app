abstract class HomeState {}

class InitialState extends HomeState {}

class OnGetNationalityLoadingState extends HomeState {}

class OnGetNationalityErrorState extends HomeState {}

class OnGetNationalitySuccessState extends HomeState {}

class OnGetNationalityCatchErrorState extends HomeState {}

class OnGetCVSLoadingState extends HomeState {}

class OnGetCVSErrorState extends HomeState {}

class OnGetCVSSuccessState extends HomeState {}

class OnGetCVSCatchErrorState extends HomeState {}

class OnGetFavoritesLoadingState extends HomeState {}
class OnGetFavoritesErrorState extends HomeState {}
class OnGetFavoritesSuccessState extends HomeState {}
class OnGetFavoritesCatchErrorState extends HomeState {}

class OnAddToFavoritesLoadingState extends HomeState {}
class OnAddToFavoritesErrorState extends HomeState {}
class OnAddToFavoritesSuccessState extends HomeState {}
class OnAddToFavoritesCatchErrorState extends HomeState {}

class OnRemoveFromFavoritesLoadingState extends HomeState {}
class OnRemoveFromFavoritesErrorState extends HomeState {}
class OnRemoveFromFavoritesSuccessState extends HomeState {}
class OnRemoveFromFavoritesCatchErrorState extends HomeState {}



class OnAddToBookingLoadingState extends HomeState {}
class OnAddToBookingErrorState extends HomeState {}
class OnAddToBookingSuccessState extends HomeState {}
class OnAddToBookingCatchErrorState extends HomeState {}
