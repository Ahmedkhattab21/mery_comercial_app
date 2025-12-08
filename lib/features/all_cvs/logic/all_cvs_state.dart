abstract class AllCvsState {}

class InitialState extends AllCvsState {}

class OnGetNationalityCvsLoadingState extends AllCvsState {}
class OnGetNationalityCvsErrorState extends AllCvsState {}
class OnGetNationalityCvsSuccessState extends AllCvsState {}
class OnGetNationalityCvsCatchErrorState extends AllCvsState {}


class OnAddToFavoritesLoadingState extends AllCvsState {}
class OnAddToFavoritesErrorState extends AllCvsState {}
class OnAddToFavoritesSuccessState extends AllCvsState {}
class OnAddToFavoritesCatchErrorState extends AllCvsState {}




class OnRemoveFromFavoritesLoadingState extends AllCvsState {}

class OnRemoveFromFavoritesErrorState extends AllCvsState {}

class OnRemoveFromFavoritesSuccessState extends AllCvsState {}

class OnRemoveFromFavoritesCatchErrorState extends AllCvsState {}

class OnAddToBookingLoadingState extends AllCvsState {}

class OnAddToBookingErrorState extends AllCvsState {}

class OnAddToBookingSuccessState extends AllCvsState {}

class OnAddToBookingCatchErrorState extends AllCvsState {}
