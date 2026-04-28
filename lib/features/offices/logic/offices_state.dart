abstract class OfficesState {}

class InitialState extends OfficesState {}

class OnGetOfficesLoadingState extends OfficesState {}
class OnGetOfficesSuccessState extends OfficesState {}
class OnGetOfficesErrorState extends OfficesState {}
class OnGetOfficesCatchErrorState extends OfficesState {}

class OnGetOfficeDetailsLoadingState extends OfficesState {}
class OnGetOfficeDetailsSuccessState extends OfficesState {}
class OnGetOfficeDetailsErrorState extends OfficesState {}
class OnGetOfficeDetailsCatchErrorState extends OfficesState {}
