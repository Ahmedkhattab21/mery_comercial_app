
abstract class EditProfileState {}

class InitialState extends EditProfileState {}



class OnGetUSerDataLoadingState extends EditProfileState {}
class OnGetUSerDataErrorState extends EditProfileState {}
class OnGetUSerDataSuccessState extends EditProfileState {}
class OnGetUSerDataCatchErrorState extends EditProfileState {}

class OnUpdateProfileLoadingState extends EditProfileState {}
class OnUpdateProfileSuccessState extends EditProfileState {}
class OnUpdateProfileErrorState extends EditProfileState {}
class OnUpdateProfileCatchErrorState extends EditProfileState {}

class OnLogOutLoadingState extends EditProfileState {}
class OnLogOutErrorState extends EditProfileState {}
class OnLogOutSuccessState extends EditProfileState {}
class OnLogOutCatchErrorState extends EditProfileState {}
