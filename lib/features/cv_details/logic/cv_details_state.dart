abstract class CvDetailsState {}

class InitialState extends CvDetailsState {}


class OnAddToFavoritesLoadingState extends CvDetailsState {}
class OnAddToFavoritesErrorState extends CvDetailsState {}
class OnAddToFavoritesSuccessState extends CvDetailsState {}
class OnAddToFavoritesCatchErrorState extends CvDetailsState {}


class OnGetDetailsLoadingState extends CvDetailsState {}
class OnGetDetailsErrorState extends CvDetailsState {}
class OnGetDetailsSuccessState extends CvDetailsState {}
class OnGetDetailsCatchErrorState extends CvDetailsState {}




class OnRemoveFromFavoritesLoadingState extends CvDetailsState {}

class OnRemoveFromFavoritesErrorState extends CvDetailsState {}

class OnRemoveFromFavoritesSuccessState extends CvDetailsState {}

class OnRemoveFromFavoritesCatchErrorState extends CvDetailsState {}

class OnAddToBookingLoadingState extends CvDetailsState {}

class OnAddToBookingErrorState extends CvDetailsState {}

class OnAddToBookingSuccessState extends CvDetailsState {}

class OnAddToBookingCatchErrorState extends CvDetailsState {}
