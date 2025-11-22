
abstract class ProfileState {}

class InitialState extends ProfileState {}

class OnLogOutLoadingState extends ProfileState {}
class OnLogOutSuccessState extends ProfileState {}
class OnLogOutErrorState extends ProfileState {}
class OnLogOutCatchErrorState extends ProfileState {}
class OnChangeSelectedImageState extends ProfileState {}
class OnEditProfileLoadingState extends ProfileState {}
class OnEditProfileErrorState extends ProfileState {}
class OnEditProfileSuccessState extends ProfileState {}
class OnEditProfileCatchErrorState extends ProfileState {}
class OnProfileInfoLoadingState extends ProfileState {}
class OnProfileInfoErrorState extends ProfileState {}
class OnProfileInfoSuccessState extends ProfileState {}
class OnProfileInfoCatchErrorState extends ProfileState {}
