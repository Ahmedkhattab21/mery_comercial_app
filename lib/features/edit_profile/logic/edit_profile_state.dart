abstract class EditProfileState {}

class InitialState extends EditProfileState {}

class OnGetUSerDataLoadingState extends EditProfileState {}

class OnGetUSerDataErrorState extends EditProfileState {}

class OnGetUSerDataSuccessState extends EditProfileState {}

class OnGetUSerDataCatchErrorState extends EditProfileState {}

class OnUpdateProfileLoadingState extends EditProfileState {}

class OnUpdateProfileSuccessState extends EditProfileState {
  String message;

  OnUpdateProfileSuccessState({required this.message});
}

class OnUpdateProfileErrorState extends EditProfileState {
  String message;

  OnUpdateProfileErrorState({required this.message});
}

class OnUpdateProfileCatchErrorState extends EditProfileState {
  String message;

  OnUpdateProfileCatchErrorState({required this.message});
}

class OnLogOutLoadingState extends EditProfileState {}

class OnLogOutErrorState extends EditProfileState {}

class OnLogOutSuccessState extends EditProfileState {}

class OnLogOutCatchErrorState extends EditProfileState {}
