import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mery_comercial_app/features/offices/data/models/offices_response_model.dart';
import 'package:mery_comercial_app/features/offices/data/repo/offices_repo.dart';
import 'package:mery_comercial_app/features/offices/logic/offices_state.dart';

class OfficesCubit extends Cubit<OfficesState> {
  final OfficesRepo _officesRepo;

  OfficesCubit(this._officesRepo) : super(InitialState());

  List<Office> offices = [];
  Office? selectedOffice;

  String? searchQuery;
  int? selectedCityId;

  getOffices({String? q, int? cityId}) {
    searchQuery = q;
    selectedCityId = cityId;
    offices = [];
    emit(OnGetOfficesLoadingState());
    _officesRepo
        .getOffices(q: q, cityId: cityId)
        .then((value) {
          value.fold(
            (l) => emit(OnGetOfficesErrorState()),
            (r) {
              offices = r.data;
              emit(OnGetOfficesSuccessState());
            },
          );
        })
        .catchError((_) => emit(OnGetOfficesCatchErrorState()));
  }

  getOfficeDetails(int id) {
    selectedOffice = null;
    emit(OnGetOfficeDetailsLoadingState());
    _officesRepo
        .getOfficeDetails(id)
        .then((value) {
          value.fold(
            (l) => emit(OnGetOfficeDetailsErrorState()),
            (r) {
              selectedOffice = r.data;
              emit(OnGetOfficeDetailsSuccessState());
            },
          );
        })
        .catchError((_) => emit(OnGetOfficeDetailsCatchErrorState()));
  }

  static OfficesCubit get(context) => BlocProvider.of(context);
}
